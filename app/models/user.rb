class User < ApplicationRecord
  enum status: %i[teacher student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :surname, presence: true
  validates :status, presence: true
end
