class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.string :name
      t.integer :rank_position
      t.string :image
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
