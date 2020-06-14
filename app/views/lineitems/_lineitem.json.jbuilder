json.extract! lineitem, :id, :phone_id, :cart_id, :created_at, :updated_at
json.url lineitem_url(lineitem, format: :json)
