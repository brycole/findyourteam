class AddRankToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :rank
  end
end
