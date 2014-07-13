json.array!(@conversations) do |conversation|
  json.extract! conversation, :id, :name
  json.url conversation_url(conversation, format: :json)
end
