json.array!(@classified_posts) do |classified_post|
  json.extract! classified_post, :id
  json.url classified_post_url(classified_post, format: :json)
end
