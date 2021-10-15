class CreateLeasingAgents < ActiveRecord::Migration[6.1]
  def change
    create_table :leasing_agents do |t|
      t.string :name
      t.string :email_address
      t.string :password_digest
      t.string :phone_number

      t.timestamps
    end
    add_index :leasing_agents, :email_address, unique: true
  end
end
