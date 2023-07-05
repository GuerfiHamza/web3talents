class RenameForgeinKeyInJob < ActiveRecord::Migration[7.0]
  def change
    rename_column :jobs, :companies_id, :company_id
    add_foreign_key :jobs, :companies, column: :company_id
  end
end
