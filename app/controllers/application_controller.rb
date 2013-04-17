class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_article_type

  private

  def set_article_type
    @type = if (article_type = params[:type]) && ARTICLE_TYPES.include?(article_type)
      article_type
    else
      'Article::General'
    end
  end
end
