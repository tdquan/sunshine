class AddAddressToSolarPanels < ActiveRecord::Migration
  def change
    add_column :solar_panels, :address, :string
  end
end
