class Message < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :receive_messages, foreign_key: 'message_id'
  has_many :receives, through: :receive_messages
end
