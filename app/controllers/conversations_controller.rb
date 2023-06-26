class ConversationsController < ApplicationController
  before_action :require_login

  def index
    @c = current_user.sent_conversations + current_user.received_conversations
    @conversations = policy_scope(Conversation).where(id: @c).order(updated_at: :desc)
  end

  def create
    recipient = User.friendly.find(params[:conversation][:recipient_id])
    conversation = Conversation.new
    conversation.sender = current_user
    conversation.recipient = recipient
    authorize conversation
    # if it exists, find it, otherwise create it
    existing_conversation = Conversation.where(sender: current_user, recipient: recipient) + Conversation.where(sender: recipient, recipient: current_user)
    if existing_conversation.present?
      redirect_to conversations_path, notice: "You already have a conversation with #{recipient.username}"
      return
    end

    if conversation.save
      redirect_to conversations_path, notice: "Conversation started with #{recipient.username}"
    else
      redirect_to user_path(recipient)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
    authorize @conversation

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def create_message
    @conversation = Conversation.find(params[:id])
    @message = @conversation.messages.new(message_params)
    @message.user = current_user

    authorize @conversation, :create_message?

    if @message.save
      PrivateConversationChannel.broadcast_to(
        @conversation,
        render_to_string(partial: 'messages/message', locals: { message: @message })
      )
      head :ok
    else
      render :show
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end


end
