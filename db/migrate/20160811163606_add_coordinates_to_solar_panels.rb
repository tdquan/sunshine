class AddCoordinatesToSolarPanels < ActiveRecord::Migration
  def change
    add_column :solar_panels, :latitude, :float
    add_column :solar_panels, :longitude, :float
  end
end
