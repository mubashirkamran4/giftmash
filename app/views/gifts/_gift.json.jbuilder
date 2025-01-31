json.extract! gift, :id, :name, :image_url, :url, :created_at, :updated_at
json.url gift_url(gift, format: :json)
