class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def type_for article
    return "" unless article && article.type.present?
    article.type.split('::').last.downcase
  end
  helper_method :type_for

  protected

  def configure_permitted_parameters
    sign_up = [:email, :password, :password_confirmation, :role]
    account_update = sign_up << :current_password
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(sign_up) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(account_update) }
  end

end
