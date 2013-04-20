class Article::City < Article
  hstore_accessor :metadata, []
end
