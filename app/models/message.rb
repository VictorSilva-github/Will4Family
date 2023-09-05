class Message < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :receive_messages, foreign_key: 'message_id'
  has_many :receives, through: :receive_messages
  validates :user_id, presence: true
  validates :message_type, presence: true
  validates :description, presence: true
  validates :user_cheking, presence: true
  validates :last_checking_at, presence: true
  validates :tolerance_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :ultimate_date, presence: true
end
