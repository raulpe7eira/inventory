json.extract! material, :id, :name, :amount, :description, :created_at, :updated_at, :user_id
json.url material_url(material, format: :json)
