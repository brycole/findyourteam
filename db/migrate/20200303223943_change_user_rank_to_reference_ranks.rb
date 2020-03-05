class ChangeUserRankToReferenceRanks < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :rank, :integer
    add_reference :users, :rank, foreign_key: true
  end
end
