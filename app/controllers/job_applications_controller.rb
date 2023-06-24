class JobApplicationsController < ApplicationController
  def index
    @job = Job.friendly.find(params[:job_id])
    @applications = JobApplication.where(job_id: @job.id)
  end

  def new
    @job = Job.friendly.find(params[:job_id])
    @application = JobApplication.new
  end

  def create
    @job = Job.friendly.find(params[:job_id])
    @application = JobApplication.new
    @application.user = current_user
    @application.job = @job
    @application.status = "pending"
    if @application.save
      redirect_to job_job_applications_path, notice: "Application submitted!"
    else
      render :new, notice: "Something went wrong!"
    end
  end

  def show
    @application = JobApplication.find(params[:id])
  end

  def edit
    @application = JobApplication.find(params[:id])
  end

  def destroy
    @application = JobApplication.find(params[:id])
    @application.destroy
    redirect_to job_job_applications_path, notice: "Application deleted!"
  end

  def update
    @application = JobApplication.find(params[:id])
    @application.update(application_params)
    redirect_to job_job_applications_path, notice: "Application updated!"
  end

  private

  def application_params
    params.require(:job_application).permit(:cover_letter, :resume_file_path)
  end
end
