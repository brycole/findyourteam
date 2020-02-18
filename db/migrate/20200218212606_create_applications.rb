class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.references :position, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :user_approval
      t.boolean :owner_approval

      t.timestamps
    end
  end
end
