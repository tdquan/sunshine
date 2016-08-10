class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, index: true, foreign_key: true
      t.references :solar_panel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
