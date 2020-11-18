class Transaction < ApplicationRecord
  enum status: %i[in out]
  validates :amount, presence: true
  belongs_to :company
  belongs_to :article
end
