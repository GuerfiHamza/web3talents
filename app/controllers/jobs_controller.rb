class JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @jobs = policy_scope(Job).order(created_at: :desc).page params[:page]
    authorize @jobs

  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params.merge(user: current_user))
    authorize @job
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    @job_application = JobApplication.new
    authorize @job
  end

  def edit
    @job = Job.find(params[:id])
    authorize @job
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    @job.destroy

    redirect_to jobs_path
  end

  def update
    @job = Job.find(params[:id])
    authorize @job
    if @job.update(job_params)
      redirect_to @job
    else
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :company, :twitter_link, :discord_invite, :description, :chain)
  end
end
