json.array!(@articles) do |article|
  json.extract! article, :headword, :clarification, :xhtml
  json.url article_url(article.becomes(Article), format: :json)
end
