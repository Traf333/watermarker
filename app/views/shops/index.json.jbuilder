json.array!(@shops) do |shop|
  json.extract! shop, :id, :domain, :name
  json.url shop_url(shop, format: :json)
end
