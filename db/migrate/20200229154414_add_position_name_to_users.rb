class AddPositionNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :position_name, foreign_key: true
  end
end
