require 'active_support/testing/time_helpers'

class UltimateDateJob < ApplicationJob
  include ActiveSupport::Testing::TimeHelpers
  queue_as :default
   # travel_to (Date.today + 3.days)
    # para Test
    # ultimate date
    # puts "perfoming victor"

  def perform
    @messages = Message.where("ultimate_date = ? ", Date.today)
    @messages.each do |message|
      receive_messages = ReceiveMessage.where(message_id: message.id)
      receive_messages.each do |receive_message|
        ReceiveCheckMailer.ultimate_date(receive_message.receive, message).deliver_later
      end
    end
  end
end
