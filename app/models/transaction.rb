class Transaction < ApplicationRecord
  belongs_to :company
  belongs_to :article
end
