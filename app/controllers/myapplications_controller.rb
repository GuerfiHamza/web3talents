class MyapplicationsController < ApplicationController

  before_action :require_login, only: [:index]

  def index
    @applications = policy_scope(JobApplication).where(user: current_user).order(created_at: :desc)
    authorize :MyApplications, :index?

  end
end
