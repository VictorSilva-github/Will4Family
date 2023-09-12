require 'active_support/testing/time_helpers'

class UltimateDateJob < ApplicationJob

  include ActiveSupport::Testing::TimeHelpers
  queue_as :default

  def perform
    # travel_to (Date.today + 3.days)
    # para Test
    # ultimate date
    puts "perfoming victor"
    @messages = Message.where("ultimate_date = ? ", Date.today)
    # @messages = Message.where("ultimate_date = ? ", Date.today)
    @messages.each do |message|
      receive_messages = ReceiveMessage.where(message_id: message.id)
      receive_messages.each do |receive_message|
        ReceiveCheckMailer.receive_check_email(receive_message.receive.email, message).deliver_now
      end
    end
  end
end
