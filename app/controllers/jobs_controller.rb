class JobsController < ApplicationController
  before_action :require_login
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params.merge(user: current_user))
    if @job.save
      redirect_to @job
    else
      render :new
    end
  end

  def show
    @job = Job.friendly.find(params[:id])
    @job_application = JobApplication.new
  end

  def edit
    @job = Job.friendly.find(params[:id])
  end

  def destroy
    @job = Job.friendly.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  def update
    @job = Job.friendly.find(params[:id])
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
