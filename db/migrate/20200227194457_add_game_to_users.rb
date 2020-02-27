class AddGameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :game, foreign_key: true, optional: true
  end
end
