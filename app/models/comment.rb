class Comment < ApplicationRecord
  validates :body, :user_id, :post_id, presence: true

  belongs_to :user

  belongs_to :post

  has_many :likes, as: :likeable, dependent: :destroy

  def num_likes
      self.likes.length
  end

end
