json.array!(@guest_lists) do |guest_list|
  json.extract! guest_list, :id, :user_id, :name, :relationship, :email, :status
  json.url guest_list_url(guest_list, format: :json)
end
