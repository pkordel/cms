class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_article_type

  private

  def set_article_type
    @type = params[:type] if params[:type] && ARTICLE_TYPES.include?(params[:type])
    @type ||= 'general'
  end
end
