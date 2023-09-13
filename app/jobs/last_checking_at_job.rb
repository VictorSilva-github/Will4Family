class LastCheckingAtJob < ApplicationJob
  queue_as :default

  def perform
    User.all.each do |user|
      next unless user.dead?

      ReceiveCheckMailer.dead_user(user).deliver_now

      user.messages.each do |message|
        message.receives.each do |receive|
          ReceiveCheckMailer.receive_gets_email(receive, message).deliver_now
        end
      end
    end
  end
end
