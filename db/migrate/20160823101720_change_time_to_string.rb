class ChangeTimeToString < ActiveRecord::Migration
  def change
    change_column :transactions, :time,  :string
    change_column :transactions, :date,  :date
  end
end
