json.array!(@watermarks) do |watermark|
  json.extract! watermark, :id, :shop_id
  json.url watermark_url(watermark, format: :json)
end
