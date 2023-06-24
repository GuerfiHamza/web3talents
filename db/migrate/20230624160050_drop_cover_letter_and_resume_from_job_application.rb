class DropCoverLetterAndResumeFromJobApplication < ActiveRecord::Migration[7.0]
  def change
    remove_column :job_applications, :cover_letter, :text
    remove_column :job_applications, :resume_file_path, :text
  end
end
