json.array!(@accounts) do |account|
  json.extract! account, :id, :insales_subdomain, :insales_id, :password
  json.url account_url(account, format: :json)
end
