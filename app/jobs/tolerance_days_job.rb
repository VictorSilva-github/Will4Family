class ToleranceDaysJob < ApplicationJob
  queue_as :default

  def perform
    # tolerance days
    @users = User.where("DATE(last_sign_in_at) + user_cheking >= :date AND DATE(last_sign_in_at) + user_cheking + tolerance_days <= :date", date: Date.today)
    @users.each do |user|
      UserMailer.checkin_reminder(user).deliver_now
    end
  end
end
