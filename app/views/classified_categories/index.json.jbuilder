json.array!(@classified_categories) do |classified_category|
  json.extract! classified_category, :id
  json.url classified_category_url(classified_category, format: :json)
end
