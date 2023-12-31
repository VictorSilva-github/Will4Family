class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  DOCUMENT_TYPE_OPTIONS = ['ID', 'Driver Licence', 'Passport']
  GENDER_TYPE_OPTIONS = ['Male', 'Female', 'Prefer not to say']

  validates :fullname, presence: true, length: { minimum: 2, maximum: 30 }
  #validates :gender, presence: true
  validates :gender, presence: { message: 'can\'t be blank' }, inclusion: { in: GENDER_TYPE_OPTIONS, message: 'is not included in the list' }
  validates :birthday, presence: true
  validate :birthday_range

  validates :checkin_days, presence: true
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
         :recoverable, :rememberable, :validatable, :trackable

  has_many :messages, foreign_key: 'user_id'
  has_many :receives, class_name: 'Receive', foreign_key: 'user_id'

  def alive?
    (Time.current - last_sign_in_at) <= checkin_days.days
  end

  def alive_tolerance?
    (Time.current - last_sign_in_at) <= checkin_days.days + tolerance_days.days
  end

  def dead?
    !alive? && !alive_tolerance?
  end

  private

  # def send_date
  #   last_sign_in_at.to_date + user_checkin.days
  # end

  # def last_tolerance_date
  #   send_date + tolerance_days.days
  # end


  def birthday_range
    if birthday.present?
      if birthday >= Date.today || birthday < 100.years.ago.to_date
        errors.add(:birthday, "Invalid date of birth.")
      end
    end
  end
end
