class Article::General < Article
  hstore_accessor :metadata, []
end
