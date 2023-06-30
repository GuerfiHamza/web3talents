class ApplicationController < ActionController::Base
  include Pundit::Authorization

  helper_method :current_user
  helper_method :logged_in?
  helper_method :get_new_nonce

  # handle current user information
  def current_user
    User.find_by(id: session[:user_id])
  end

  # is anybody here? ;)
  def logged_in?
    !current_user.nil?
  end

  def check_signed_in
    redirect_to root_path if logged_in?
  end

  # need to generate new nonce for sign ups
  def get_new_nonce
    SecureRandom.uuid
  end
  # Pundit: allow-list approach
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(login_path)
  end

  private

  def skip_pundit?
     params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
