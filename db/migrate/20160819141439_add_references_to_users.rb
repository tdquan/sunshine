class AddReferencesToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :consumption_pattern, foreign_key: true
    add_reference :users, :production_pattern, foreign_key: true
  end
end
