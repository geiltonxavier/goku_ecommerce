json.extract! address, :id, :zip_code, :street, :state, :city, :neighborhood, :created_at, :updated_at
json.url address_url(address, format: :json)