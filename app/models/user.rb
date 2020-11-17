class User < ApplicationRecord
  enum status: %i[teacher student]

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :companies
  validates :name, presence: true
  validates :surname, presence: true
  validates :status, presence: true
end
