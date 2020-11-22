class Transaction < ApplicationRecord
  enum status: %i[in out]
  belongs_to :company
  belongs_to :article
  
  validates :amount, presence: true
  validates :transaction_time, presence: true
  validate :year_of_transaction, on: :create

  scope :report_by_year, lambda { |year|
    joins(:article)
      .select("status, articles.name, (EXTRACT(MONTH FROM transaction_time))::integer as month, sum(amount) as total")
      .where('EXTRACT(YEAR FROM transaction_time)::integer = ?', year)
      .group("status, articles.name, month")
  } 

  private 

  def year_of_transaction
    errors.add(:transaction_time, 'Transactions can be made only in two-years period') if transaction_time.year >= Time.now.year + 3
  end
end
