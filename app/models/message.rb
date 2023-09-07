class Message < ApplicationRecord
  belongs_to :user
  has_many :receive_messages, foreign_key: 'message_id'
  has_many :receives, through: :receive_messages
  validates :user_id, presence: true

  validates :message_type, presence: true
  enum message_type: { "Message" => 0, "Secrets" => 1, "Passwords" => 2, "Last Wishes" => 3, "Last Words " => 4, "Will For Family" => 5 }
  # enum message_type: { Last Wishes: 0, Last Words: 1, Passwords: 2, Secrets: 3, Will: 4, Message: 5 }
  validates :description, presence: true
  validates :user_cheking, presence: true
  # validates :last_checking_at, presence: true
  validates :tolerance_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :ultimate_date, presence: true
end
