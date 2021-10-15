class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :application_id
      t.date :datetime
      t.string :property
      t.integer :approved_rejected_processing

      t.timestamps
    end
    add_index :applications, :application_id, unique: true
  end
end
