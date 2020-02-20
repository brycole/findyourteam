class CreatePendingApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :pending_applications do |t|
      t.references :user, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
