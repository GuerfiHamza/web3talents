class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :eth_address, presence: true, uniqueness: true
  validates :eth_nonce, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :likes

  extend FriendlyId

  friendly_id :username, use: :slugged
end
