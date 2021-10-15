class ChangeTableColumnType < ActiveRecord::Migration[6.1]
def change
    #https://stackoverflow.com/questions/50088008/error-on-heroku-whenever-i-try-to-change-database-column-type
    #change_column :properties, :pets_allowed, :boolean, using: 'pets_allowed::boolean'
    #change_column :properties, :laundry, :boolean, using: 'laundry::boolean'
    #change_column :properties, :parking, :boolean, using: 'parking::boolean'
    #change_column :table_name, :column_name, 'integer USING CAST(column_name AS integer)'
    #change_column :table_name, :column_name, :integer, using: 'column_name::integer'

    remove_column :properties, :pets_allowed
    add_column :properties, :pets_allowed, :boolean

    remove_column :properties, :laundry
    add_column :properties, :laundry, :boolean

    remove_column :properties, :parking
    add_column :properties, :parking, :boolean

    end
end
