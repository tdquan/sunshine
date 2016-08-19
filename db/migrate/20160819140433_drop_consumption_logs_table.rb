class DropConsumptionLogsTable < ActiveRecord::Migration
  def change
    drop_table :consumption_logs
  end
end
