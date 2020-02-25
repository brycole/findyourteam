class AddShowGameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :show_game, :string
  end
end
