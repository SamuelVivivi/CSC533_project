json.extract! applicant, :id, :name, :email_address, :password, :phone_number, :property_applied, :property_occupied, :created_at, :updated_at
json.url applicant_url(applicant, format: :json)
