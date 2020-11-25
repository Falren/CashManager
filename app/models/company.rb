# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :country, presence: true
  validates :name, presence: true, uniqueness: true, allow_nil: true
  validate :student_required, on: :create

  private

  def student_required
    errors.add(:user_id) unless user.student?
  end
end
