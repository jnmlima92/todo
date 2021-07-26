json.extract! message, :id, :description, :hexadecimal_color, :message_type, :created_at, :updated_at
json.url message_url(message, format: :json)
