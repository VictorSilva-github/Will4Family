class ReceiveCheckMailer < ApplicationMailer
    # caso voce morrar, tudo sera enviado para seus recebedores
  def receive_gets_email(receive, message)
    @message = message
    @receive = receive
    mail(to: receive.email, subject: 'Message back mailer Will4familly')
  end
  # caso voce nao faz login a mais de (user_checkin) dias,
   # te mandaremos um email, te enviaremos email todos os (telegram_days)

  def tolerance_check(user)
    @user = user
    mail(to: @user.email, subject: 'Are you alive?')
  end

  # caso last_checking_at and tolerance_days ARE (FALSE)
  def dead_user(user)
    @user = user
    mail(to: @user.email, subject: 'We are sending all of your W4F to your recipients')
  end

  # Quando a data programada chegar!
  def ultimate_date(receive, message)
    @message = message
    @receive = receive
    mail(to: receive.email, subject: 'dispara tudou')
  end
end
