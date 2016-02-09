json.array!(@tables) do |table|
  json.extract! table, :id, :user_id, :name, :kind, :size, :position, :num_of_seats
  json.url table_url(table, format: :json)
end
