class RemoveReferencesFromProductionConsumption < ActiveRecord::Migration
  def change
    remove_reference :production_patterns, :solar_panel
    remove_reference :consumption_patterns, :user
    add_reference :production_patterns, :solar_panel, foreign_key: true
    add_reference :consumption_patterns, :user, foreign_key: true
  end
end
