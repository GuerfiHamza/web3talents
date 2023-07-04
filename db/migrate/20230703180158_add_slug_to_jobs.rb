class AddSlugToJobs < ActiveRecord::Migration[7.0]
  def change
    add_index :jobs, :slug, unique: true
    add_index :job_categories, :slug, unique: true
    add_index :companies, :slug, unique: true
  end
end
