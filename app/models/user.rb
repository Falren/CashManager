class User < ApplicationRecord
  enum status: %i[teacher student]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
