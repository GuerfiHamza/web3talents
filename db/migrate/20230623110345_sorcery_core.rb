class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :eth_address, null: false, index: { unique: true }
      t.string :eth_nonce
      t.string :headline, default: ""
      t.string :profile_picture, default: ""
      t.string :cover_picture, default: ""
      t.string :summary, default: ""
      t.text :experience, default: "", array: true, default: []
      t.text :job, default: "", array: true, default: []
      t.text :skills, default: "", array: true, default: []
      t.text :website, default: ""
      t.string :twitter, default: ""
      t.string :discord, default: ""
      t.string :salt

      t.timestamps                null: false
    end
  end
end
