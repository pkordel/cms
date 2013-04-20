class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def type_for article
    return "" unless article && article.type.present?
    article.type.split('::').last.downcase
  end
  helper_method :type_for

end
