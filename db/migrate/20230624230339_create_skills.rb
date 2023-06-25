class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :skills, :string
    create_table :skills do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
