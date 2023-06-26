# To deliver this notification:
#
# JobApplicationNotification.with(post: @post).deliver_later(current_user)
# JobApplicationNotification.with(post: @post).deliver(current_user)

class JobApplicationNotification < Noticed::Base
  # Add your delivery methods
  #
  # deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
    # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #

  def job_application
    params[:message]
  end

  def creator
    job_application.user
  end

  def job
    job_application.job
  end

  def url
    job_path(params[:job_id])
  end

  def status
    job_application.status
  end
end
