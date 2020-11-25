# frozen_string_literal: true

class Transaction < ApplicationRecord
  attribute :transaction_time, :datetime, default: proc { Time.now }
  enum status: %i[in out]

  belongs_to :company
  belongs_to :article

  validates :amount, :transaction_time, presence: true
  validate :year_of_transaction, on: :create

  scope :report_by_year,
        lambda { |year|
          joins(:article)
            .select('status, articles.name, (EXTRACT(MONTH FROM transaction_time))::integer as month,
                    sum(amount) as total')
            .where('EXTRACT(YEAR FROM transaction_time)::integer = ?', year)
            .group('status, articles.name, month')
        }

  private

  def year_of_transaction
    errors.add(:transaction_time) if transaction_time >= 2.years.from_now
  end
end
