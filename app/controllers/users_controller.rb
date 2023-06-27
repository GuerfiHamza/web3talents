require "eth"

class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  before_action :check_signed_in, only: [:new, :create]

  # instantiate a new user
  def new
    @user = User.new
    authorize :application, :signup?
  end

  def edit
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  # create a new user based on user input
  def create
    # create new user from allowed params
    @user = User.new(user_params)

    # only proceed with pretty names
    if @user and @user.username and @user.username.size > 0

      # create randome nonce
      @user.eth_nonce = SecureRandom.uuid

      # usually, we want to let the user sign the nonce to make sure
      # they are authorized to create a new user account for the
      # given ethereum address. for the demo, we skip this for the
      # sake of keeping it simple.

      # only proceed with eth address
      if @user.eth_address

        # make sure the eth address is valid
        address = Eth::Address.new @user.eth_address
        if address.valid?

          # save to database
          if @user.save
            # if user is created, congratulations, send them to login
            redirect_to login_path, notice: "Successfully created an account, you may now log in."
          else

            # if it fails, eth address is already in database, go to login
            redirect_to login_path, alert: "Account already exists! Try to log in instead!"
          end
        else

          # if it fails, the eth address is not valid, stay on signup
          flash.now[:alert] = "Invalid Ethereum address!"
          render :new
        end
      else

        # if it fails, the process was interupted, stay on signup
        flash.now[:alert] = "Failed to get Ethereum address!"
        render :new
      end
    else

      # if it fails, the user did not specify a name, stay on signup
      flash.now[:alert] = "Please choose a name (length > 0)!"
      render :new
    end
    authorize :application, :signup?

  end

  # update user based on user input
  def update
    @user = User.friendly.find(params[:id])
    @user.slug = update_user_params[:username]
    authorize @user
    if @user.update(update_user_params)
      redirect_to @user, notice: "Successfully updated your profile."
    else
      render :edit, status: :unprocessable_entity , alert: "Failed to update your profile."
    end
  end

  # show user profile
  def show
    @user = User.friendly.find(params[:id])
    recipient = User.friendly.find(params[:id])
    conversation = Conversation.new(sender: current_user, recipient: recipient)

    authorize @user
  end

  private

  def update_user_params
    params.require(:user).permit(:username, :headline, :profile_picture, :cover_picture, :summary, :job, :website, :discord, :twitter,
       experiences_attributes: [:id, :_destroy, :title, :company, :social_links, :description], skills_attributes: [:id, :_destroy, :name])
  end

  # only allow user to control name, message, signature, and address
  def user_params
    # only allow user to control name, message, signature, and address
    params.require(:user).permit(:username, :eth_address)
  end
end
