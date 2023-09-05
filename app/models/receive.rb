class Receive < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :receive_messages, foreign_key: 'receive_id'
  has_many :messages, through: :receive_messages
end
