class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :eth_address, presence: true, uniqueness: true
  validates :eth_nonce, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :likes
  has_many :experiences
  has_many :posts
  has_many :job_applications
  has_many :jobs
  has_many :skills
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  has_one_attached :profile_picture
  has_one_attached :cover_picture

  extend FriendlyId

  friendly_id :username, use: :slugged


end
