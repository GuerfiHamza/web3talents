class MyjobsController < ApplicationController
  before_action :require_login, only: [:index]
  before_action :skip_authorization, only: [:index]
  def index
    @myjobs = policy_scope(Job).where(user_id: current_user.id).reverse
  end
end
