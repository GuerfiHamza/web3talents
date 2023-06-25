class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    # create the table
    create_table :experiences do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :company, null: false
      t.string :social_links
      t.text :description
      t.timestamps
    end
    add_index :experiences, :user_id
  end
end
