
json.extract! admin, :id, :password, :name, :email, :phone_number, :created_at, :updated_at

json.extract! admin, :id, :name, :email_address, :password, :phone_number, :created_at, :updated_at

json.url admin_url(admin, format: :json)
