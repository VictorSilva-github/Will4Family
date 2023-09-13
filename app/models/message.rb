class Message < ApplicationRecord
  MESSAGE_TYPE = { "Scheduled message" => 0, "Secrets" => 1, "Passwords" => 2, "Last Wishes" => 3, "Last Words " => 4, "Will For Family" => 5 }.freeze

  belongs_to :user
  has_many :receive_messages, foreign_key: 'message_id', dependent: :destroy
  has_many :receives, through: :receive_messages
  validates :user_id, presence: true
  validates :title, presence: true
  validates :message_type, presence: true
  enum message_type: MESSAGE_TYPE
  validates :description, presence: true
  # validates :last_checking_at, presence: true
end
