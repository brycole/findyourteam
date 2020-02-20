class CreatePositionNames < ActiveRecord::Migration[5.2]
  def change
    create_table :position_names do |t|
      t.string :name
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
