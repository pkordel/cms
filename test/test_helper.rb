ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

class ActiveSupport::TestCase

  def sign_in_user user
    visit new_user_session_path
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    click_button 'Sign in'
  end
  
end
