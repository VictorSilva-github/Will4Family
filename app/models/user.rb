class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  DOCUMENT_TYPE_OPTIONS = ['ID', 'Driver Licence', 'Passport']

  validates :fullname, presence: true, length: { minimum: 2, maximum: 30 }
  validates :gender, presence: true
  validates :birthday, presence: true
  validate :birthday_range

  validates :user_cheking, presence: true
  validates :tolerance_days, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  validates :document_type, presence: { message: 'can\'t be blank' }, inclusion: { in: DOCUMENT_TYPE_OPTIONS, message: 'is not included in the list' }
  validates :document_number, presence: true, length: { minimum: 5, maximum: 15 }, uniqueness: true
  # validates :phone_number, presence: true, length: { minimum: 9, maximum: 15 }, format: { with: /\A(\(\d{2}\)|\d{2})[-.\s]?\d{4,5}[-.\s]?\d{4}\z/ }
  validates :phone_number, presence: true, length: { minimum: 9, maximum: 20 }, format: { with: /\A\+\d{1,3}\s?\d{1,8}[-]?\d{4}\z/ }
  validates :post_code, presence: true, length: { minimum: 5, maximum: 10 }
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, foreign_key: 'user_id'
  has_many :receives, class_name: 'Receive', foreign_key: 'user_id'

  private

  def send_date
    last_sign_in_at.to_date + user_checkin.days
  end

  def last_tolerance_date
    send_date + tolerance_days.days
  end

  def birthday_range
    if birthday.present?
      if birthday >= Date.today || birthday < 100.years.ago.to_date
        errors.add(:birthday, "Invalid date of birth.")
      end
    end
  end
end


# def birthday_range
#   if birthday.present?
#     if birthday == Date.today
#       errors.add(:birthday, "It cannot be the same as the current day.")
#     elsif birthday > Date.today || birthday < 100.years.ago.to_date
#       errors.add(:birthday, "Invalid date of birth.")
#     end
#   end
# end
# end
