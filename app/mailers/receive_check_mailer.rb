class ReceiveCheckMailer < ApplicationMailer
  def receive_check_email(receive_email, message)
    @message = message
    mail(to: receive_email, subject: 'Message back mailer Will4familly')
  end
end
