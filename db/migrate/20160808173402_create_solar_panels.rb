class CreateSolarPanels < ActiveRecord::Migration
  def change
    create_table :solar_panels do |t|
      t.integer :size
      t.float :efficiency
      t.float :price
      t.references :users

      t.timestamps null: false
    end
  end
end
