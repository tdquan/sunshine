class ChangeUserIdColumn < ActiveRecord::Migration
  def change
    add_reference :solar_panels, :user, foreign_key: true
    remove_reference :solar_panels, :users
  end
end
