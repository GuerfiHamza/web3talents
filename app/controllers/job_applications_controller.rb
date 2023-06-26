class JobApplicationsController < ApplicationController
  def index
    @job = Job.friendly.find(params[:job_id])
    @applications = policy_scope(JobApplication).where(job: @job).order(created_at: :desc)
    authorize @applications

  end

  def new
    @job = Job.friendly.find(params[:job_id])
    @application = JobApplication.new
    authorize @application
  end

  def create
    @job = Job.friendly.find(params[:job_id])
    @application = JobApplication.new
    @application.user = current_user
    @application.job = @job
    @application.status = "pending"
    authorize @application

    if @application.save
      redirect_to job_job_applications_path, notice: "Application submitted!"
    else
      render :new, notice: "Something went wrong!"
    end
  end

  def show
    @application = JobApplication.includes(:user, :experiences, :skills).find(params[:id])
    if current_user
      current_user.notifications.mark_as_read!
      @notifications = current_user.notifications.reverse
    end
    authorize @application
  end

  def edit
    @application = JobApplication.find(params[:id])
    authorize @application
  end

  def destroy
    @application = JobApplication.find(params[:id])
    @job = @application.job
    authorize @application
    @application.destroy
    redirect_to job_job_applications_path(@job), notice: "Application deleted!"
  end

  def update
    @application = JobApplication.find(params[:id])
    authorize @application
    @application.update(application_params)
    redirect_to job_application_path(@application), notice: "Application updated!"
  end

  private

  def application_params
    params.require(:job_application).permit(:status)
  end
end
