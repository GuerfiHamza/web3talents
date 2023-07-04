class Company < ApplicationRecord
  # belongs_to :user
  self.table_name = "companies"

  has_many :jobs, dependent: :destroy
  has_many :job_applications, through: :jobs
  paginates_per 12

  def job_count
    self.jobs.length
  end
end
