class RemoveReferencesFromProductionConsumption < ActiveRecord::Migration
  def change
    add_reference :production_patterns, :solar_panel, foreign_key: true
    add_reference :consumption_patterns, :user, foreign_key: true
  end
end
