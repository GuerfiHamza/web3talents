class CompanyController < ApplicationController
  before_action :authenticate_user!

  def index
    @companies = policy_scope(Company).order(created_at: :desc).page params[:page]

  end

  def show
  end

  def update
  end

  def delete
  end

  def new
  end

  def create
  end
end
