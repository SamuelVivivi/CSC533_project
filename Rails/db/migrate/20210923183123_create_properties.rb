class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :product_id
      t.string :name
      t.string :address
      t.integer :size
      t.integer :pets_allowed
      t.integer :laundry
      t.integer :parking
      t.integer :terms_available
      t.date :earliest_start_date
      t.numeric :application_fee
      t.numeric :monthly_rent
      t.string :occupied_by

      t.timestamps
    end
  end
end
