class CreateJobCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :job_categories do |t|
      t.string :title
      t.string :slug
      t.integer :index
      t.string :_id

      t.timestamps

    end
  end
end
