class RenameLinkToSocialLinksAndChangeTypeToStringInExperience < ActiveRecord::Migration[7.0]
  def change
    change_column :experiences, :link, :string
    rename_column :experiences, :link, :social_links

  end
end
