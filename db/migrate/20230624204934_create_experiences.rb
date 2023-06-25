class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    # remove the column from users
    remove_column :users, :experience, :string
    # create the table
    create_table :experiences do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :project_name, null: false
      t.date :link
      t.text :description
      t.timestamps
    end
    add_index :experiences, :user_id
  end
end
