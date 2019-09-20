json.extract! post, :id, :date, :title, :description, :created_at, :updated_at
json.url post_url(post, format: :json)
