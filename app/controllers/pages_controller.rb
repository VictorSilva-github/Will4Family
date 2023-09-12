class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  after_action :last_checking_at, if: proc { user_signed_in? }

  def home
  end

  private

  def last_checking_at
    @current_user.update_attribute(:last_checking_at, Date.today)
  end
end
