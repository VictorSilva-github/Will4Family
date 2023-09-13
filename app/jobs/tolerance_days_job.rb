class ToleranceDaysJob < ApplicationJob
  queue_as :default

  def perform
    # tolerance days
    User.all.each do |user|
      next if user.alive?
      
      ReceiveCheckMailer.tolerance_check(user).deliver_now if user.alive_tolerance?
    end
  end
end
