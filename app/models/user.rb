# frozen_string_literal: true

class User < ApplicationRecord
  enum status: %i[teacher student]

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_one_attached :photo
  has_many :companies

  validates :name, :surname, :status, presence: true
end
