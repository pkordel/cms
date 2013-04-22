module ArticlesHelper
  def content_for article
    raw(article.content.html_safe.truncate(300, separator: ' ',
      omission: " ... #{ link_to 'Read more', article_path(article) }"))
  end
end
