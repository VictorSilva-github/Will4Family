class LastCheckingAtJob < ApplicationJob
  queue_as :default

  def last_sign_in
    # listar usuarios
    @users = User.where("DATE(last_sign_in_at) + user_cheking + tolerance_days = ? ", Date.today)
    @users.each do |user|
      user.messages.where(ultimate_date: nil ).each do |message|
        UserMailer.checkin_reminder(user).deliver_now
        # envia o email no limite do prazo
        # last sign + user_checkin + tolerance_days
      end
    end
  end

  def ultimate_date
  @users = User.where("ultimate_date >= ? ", Date.today)
    @users.each do |user|
      user.messages.where(ultimate_date: Date.today).each do |message|
        UserMailer.checkin_reminder(user, message).deliver_now
        # REMINDER MUDA?
        # MAILER VAI MUDAR
      end
    end
  end

  def tolerance_days
    @users = User.where("tolerance_days <= ? ", Date.today)
    @users.each do |user|
      user.messages.where(tolerance_days: Date.today).each do |message|
        user_tolerance_days = user.tolerance_days - 1
        UserMailer.checkin_reminder(user, message).deliver_now
      end
    end
  end

end
