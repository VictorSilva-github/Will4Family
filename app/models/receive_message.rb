class ReceiveMessage < ApplicationRecord
  belongs_to :message
  belongs_to :receive
  validates :receive, uniqueness: { scope: :message }
end
