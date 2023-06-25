class Experience < ApplicationRecord

  validates :user_id, :title, :company, :social_links, presence: true

  belongs_to :user

end
