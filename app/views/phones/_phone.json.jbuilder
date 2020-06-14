json.extract! phone, :id, :name, :display, :ram, :memory, :processor, :front_camera, :back_camera, :price, :image, :created_at, :updated_at
json.url phone_url(phone, format: :json)
