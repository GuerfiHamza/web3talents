class JobApplication < ApplicationRecord
  belongs_to :user
  belongs_to :job
  validates :cover_letter, :resume_file_path, presence: true
  validates :status, presence: true, inclusion: { in: %w(pending accepted rejected) }
  validates :cover_letter, length: { minimum: 1 }
  # validate :job_owner_cannot_apply

  # def job_owner_cannot_apply
  #   if job.user_id == user_id
  #     errors.add(:user_id, "can't be the same as job owner")
  #   end
  # end

  def self.statuses
    %w(pending accepted rejected)
  end

  def self.statuses_for_select
    statuses.map { |status| [status.capitalize, status] }
  end
end
