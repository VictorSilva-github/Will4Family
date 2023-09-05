class ReceiveMessage < ApplicationRecord
  belongs_to :message, foreign_key: 'message_id'
  belongs_to :receive, foreign_key: 'receive_id'
end
