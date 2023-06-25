class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :company
      t.string :twitter_link
      t.string :discord_invite
      t.string :os_link
      t.text :description
      t.string :chain

      t.timestamps
    end
  end
end
