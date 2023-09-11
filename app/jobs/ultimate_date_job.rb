class LastCheckingAtJob < ApplicationJob
  queue_as :default

  def perform
    # ultimate date
    puts "perfoming victor"
  @messages = Message.where("ultimate_date >= ? ", Date.today)
    @messages.each do |message|
      UserMailer.checkin_reminder(message.user).deliver_now
        # REMINDER MUDA?
        # MAILER VAI MUDAR
      end
    end
  end
end
