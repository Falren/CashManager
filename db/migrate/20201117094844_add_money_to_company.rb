class AddMoneyToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :money, :integer, default: 100
  end
end
