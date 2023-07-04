class CreateJobsList < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :slug, null: true
      t.string :location, null: true
      t.text :description
      t.string :chain, default: ""
      t.string :apply_url, null: true
      t.string :job_type, null: true
      t.string :payscale_max, null: true
      t.string :payscale_min, null: true
      t.boolean :pay_in_crypto, default: false
      t.boolean :isWorldwide, default: false
      t.references :companies, null: true, foreign_key: true
      t.references :job_categories, null: true, foreign_key: true

      t.timestamps
    end
  end
end
