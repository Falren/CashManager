# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :user
  has_many :transactions

  validates :country, presence: true
  validates :name, presence: true
  validate :student_required, on: :create

  private

  def student_required
    errors.add(:user_id, 'must be a student') unless user.student?
  end
end
