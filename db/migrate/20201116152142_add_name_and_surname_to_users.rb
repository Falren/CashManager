# frozen_string_literal: true

class AddNameAndSurnameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
  end
end
