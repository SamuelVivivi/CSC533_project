class ChangeSomeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :applications, :property, :property_name
  end
end
