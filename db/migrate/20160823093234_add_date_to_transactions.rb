class AddDateToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :date, :datetime
  end
end
