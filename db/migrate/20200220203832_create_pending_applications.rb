class CreatePendingApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :pending_applications do |t|
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true
      t.boolean :owner_approval, default: false
      t.boolean :user_approval, default: false

      t.timestamps
    end
  end
end
