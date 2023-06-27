class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  belongs_to :sender, class_name: 'User', foreign_key: 'user_id'
  def sender?(a_user)
    user.id == a_user.id
  end
end
