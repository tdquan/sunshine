class CreateProductionPatterns < ActiveRecord::Migration
  def change
    create_table :production_patterns do |t|
      t.datetime :time
      t.float :hour_01
      t.float :hour_02
      t.float :hour_03
      t.float :hour_04
      t.float :hour_05
      t.float :hour_06
      t.float :hour_07
      t.float :hour_08
      t.float :hour_09
      t.float :hour_10
      t.float :hour_11
      t.float :hour_12
      t.float :hour_13
      t.float :hour_14
      t.float :hour_15
      t.float :hour_16
      t.float :hour_17
      t.float :hour_18
      t.float :hour_19
      t.float :hour_20
      t.float :hour_21
      t.float :hour_22
      t.float :hour_23
      t.float :hour_24

      t.timestamps null: false
    end
  end
end
