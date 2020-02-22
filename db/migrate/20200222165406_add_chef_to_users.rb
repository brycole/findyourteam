class AddChefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rank, :integer
  end
end
