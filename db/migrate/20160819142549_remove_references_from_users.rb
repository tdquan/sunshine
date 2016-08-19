class RemoveReferencesFromUsers < ActiveRecord::Migration
  def change
    remove_reference :users, :consumption_pattern
    remove_reference :users, :production_pattern
  end
end
