class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :excess
      t.datetime :time
      t.float :fee
      t.references :contract, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
