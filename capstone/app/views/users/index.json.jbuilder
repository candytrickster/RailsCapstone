json.array!(@users) do |user|
  json.extract! user, :id, :name, :fianceeName, :email, :wedDate
  json.url user_url(user, format: :json)
end
