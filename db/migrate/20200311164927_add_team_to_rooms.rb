class AddTeamToRooms < ActiveRecord::Migration[5.2]
  def change
    add_reference :rooms, :team, foreign_key: true
  end
end
