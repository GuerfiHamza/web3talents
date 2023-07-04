class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.text :bio, null: true
      t.string :logo, null: true
      t.string :banner, null: true
      t.text :contact, array: true, default: []
      t.string :website, null: true
      t.string :_id, null: true
      t.references :user, null: true, foreign_key: true

      t.timestamps


    end
  end
end
