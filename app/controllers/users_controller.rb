require "eth"

class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  # instantiate a new user
  def new
    @user = User.new
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  # create a new user based on user input
  def create
  end

  # update user based on user input
  def update
    @user = User.friendly.find(params[:id])
    @user.slug = update_user_params[:username]
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
