class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country
      t.references :user, null: false, foreign_key: true
      t.string :currency

      t.timestamps
    end
  end
end
