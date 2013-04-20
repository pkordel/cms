json.array!(@taxonomies) do |taxonomy|
  json.extract! taxonomy, 
  json.url taxonomy_url(taxonomy, format: :json)
end