class CompanyController < ApplicationController
  before_action :authenticate_user!

  def index
    @companies = policy_scope(Company).order(created_at: :asc).page params[:page]
  end

  def show
    @company = Company.find(params[:id])
    authorize @company
    @jobs = @company.jobs.order(created_at: :desc).page params[:page]
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
