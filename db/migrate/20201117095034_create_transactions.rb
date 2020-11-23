# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :company, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.integer :amount
      t.integer :status
      t.datetime :transaction_time

      t.timestamps
    end
  end
end
