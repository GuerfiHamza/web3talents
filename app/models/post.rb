class Post < ApplicationRecord
  validate :ensure_content

  validates :body, :user_id, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy

  has_many :likes, as: :likeable

  # has_one_attached :media, dependent: :destroy

  def ensure_content
    unless self.body.length > 0 || self.media.attached?
      errors.add(:post, 'must have content')
    end
  end

  def num_likes
    self.likes.length
  end

  def who_liked
    self.likes.map { |like| like.user }
  end
end
