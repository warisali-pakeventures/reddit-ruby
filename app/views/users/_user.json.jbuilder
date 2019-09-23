json.extract! user, :id, :name, :username, :profilePicUrl, :description, :created_at, :updated_at
json.url user_url(user, format: :json)
