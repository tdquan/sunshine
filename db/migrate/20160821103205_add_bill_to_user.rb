class AddBillToUser < ActiveRecord::Migration
  def change
    add_column :users, :bill, :integer
  end
end
