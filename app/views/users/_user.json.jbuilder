json.extract! user, :id, :fullname, :email, :telephone, :created_at, :updated_at
json.url user_url(user, format: :json)
