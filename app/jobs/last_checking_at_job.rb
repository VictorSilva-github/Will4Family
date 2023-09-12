class LastCheckingAtJob < ApplicationJob
  queue_as :default

  def perform
    # checkin users
    puts "performing LastCheckingAtJob"
    # listar usuarios
    @users = User.where("DATE(last_sign_in_at) + user_cheking + tolerance_days = ? ", Date.today)
    @users.each do |user|
      user.messages.where(ultimate_date: nil).each do |message|
        UserMailer.checkin_reminder(user).deliver_now
        # envia o email no limite do prazo
        # last sign + user_checkin + tolerance_days
      end
    end
  end
end
