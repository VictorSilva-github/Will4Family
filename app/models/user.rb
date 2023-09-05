class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  #validades :encrypted_password, presence: true
  #validades :reset_password_token, presence: true
  #validades :reset_password_sent_at,
  #validates #:custom_remember_created_at_validation
  #validates :created_at, presence: true
  #validates :updated_at, presence: true
  validates :fullname, presence: true, length: { minimum: 2, maximum: 100 }
  validates :gender, presence: true
  validates :birthday, presence: true

  DOCUMENT_TYPE_OPTIONS = ['ID', 'Driver licence', 'Passaport']
  validates :document_type, presence: true, inclusion: { in: DOCUMENT_TYPE_OPTIONS }

  validates :document_number, presence: true
  validates :phone_number, presence: true, length: { minimum: 9, maximum: 15 }, format: { with: /\A(\(\d{2}\)|\d{2})[-.\s]?\d{4,5}[-.\s]?\d{4}\z/ }
  validates :post_code, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :country, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages, foreign_key: 'user_id'
  has_many :receives, foreign_key: 'user_id'
end
