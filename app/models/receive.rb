class Receive < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_many :receive_messages, foreign_key: 'receive_id'
  has_many :messages, through: :receive_messages
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true, length: { minimum: 9, maximum: 15 }, format: { with: /\A(\(\d{2}\)|\d{2})[-.\s]?\d{4,5}[-.\s]?\d{4}\z/ }
  validates :additional_info, presence: true
end
