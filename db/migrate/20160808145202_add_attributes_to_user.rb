class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :family_size, :integer
    add_column :users, :apartment_size, :integer
  end
end
