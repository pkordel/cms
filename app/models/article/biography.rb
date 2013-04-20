class Article::Biography < Article
  hstore_accessor :metadata, :firstname, :lastname,
                             :place_of_death, :death_date,
                             :birthplace, :birth_date, :gender
  def title
    title = "#{firstname} #{lastname}"
    title << " - #{clarification}" if clarification.present?
    title
  end
end
