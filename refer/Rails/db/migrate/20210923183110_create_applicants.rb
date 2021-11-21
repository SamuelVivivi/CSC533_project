class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.string :email_address
      t.string :password_digest
      t.string :phone_number
      t.integer :property_applied
      t.integer :property_occupied

      t.timestamps
    end
    add_index :applicants, :email_address, unique: true
  end
end
