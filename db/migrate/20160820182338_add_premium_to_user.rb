class AddPremiumToUser < ActiveRecord::Migration
  def change
    add_column :users, :premium, :integer
  end
end
