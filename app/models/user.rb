class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  DOCUMENT_TYPE_OPTIONS = ['ID', 'Driver Licence', 'Passport']

  validates :fullname, presence: true, length: { minimum: 2, maximum: 30 }
  validates :gender, presence: true
  validates :birthday, presence: true
  # validates :document_type, presence: true, inclusion: { in: DOCUMENT_TYPE_OPTIONS }
  validates :document_type, presence: { message: 'can\'t be blank' }, inclusion: { in: DOCUMENT_TYPE_OPTIONS, message: 'is not included in the list' }

  validates :document_number, presence: true, length: { minimum: 5, maximum: 15 }, uniqueness: true
  validates :phone_number, presence: true, length: { minimum: 9, maximum: 15 }, format: { with: /\A(\(\d{2}\)|\d{2})[-.\s]?\d{4,5}[-.\s]?\d{4}\z/ }
  validates :post_code, presence: true, length: { minimum: 5, maximum: 10 }
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, foreign_key: 'user_id'
  has_many :receives, foreign_key: 'user_id'
end
