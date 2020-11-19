class Transaction < ApplicationRecord
  enum status: %i[in out]
  validates :amount, presence: true
  belongs_to :company
  belongs_to :article

  scope :report_by_year, lambda { |year|
    joins(:article)
      .select("status, articles.name, (EXTRACT(MONTH FROM transaction_time))::integer as month, sum(amount) as total")
      .where('EXTRACT(YEAR FROM transaction_time)::integer = ?', year)
      .group("status, articles.name, month")
  } 
end
