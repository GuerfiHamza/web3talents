class Experience < ApplicationRecord

  validates :user_id, :title, :project_name, :social_links, presence: true

  belongs_to :user

end
