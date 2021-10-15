class AddColumnToApplications < ActiveRecord::Migration[6.1]
  def change
    add_column :applications, :applicant_name, :string
  end
end
