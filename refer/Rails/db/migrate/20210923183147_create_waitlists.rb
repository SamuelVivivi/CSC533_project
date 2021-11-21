class CreateWaitlists < ActiveRecord::Migration[6.1]
  def change
    create_table :waitlists do |t|
      t.string :applicant_id
      t.date :datetime
      t.string :property
      t.integer :approved_rejected_processing

      t.timestamps
    end
    add_index :waitlists, :applicant_id, unique: true
  end
end
