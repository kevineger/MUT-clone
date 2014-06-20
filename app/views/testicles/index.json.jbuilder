json.array!(@testicles) do |testicle|
  json.extract! testicle, :id, :size
  json.url testicle_url(testicle, format: :json)
end
