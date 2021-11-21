class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email_address
      t.string :password_digest
      t.string :phone_number

      t.timestamps
    end
    add_index :admins, :email_address, unique: true
  end
end
