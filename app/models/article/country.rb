class Article::Country < Article
  hstore_accessor :metadata, :official_name, :norwegian_name,
                             :form_of_government, :area,
                             :population, :population_density,
                             :capital, :official_language,
                             :religion, :national_day,
                             :head_of_state, :prime_minister, :currency
end
