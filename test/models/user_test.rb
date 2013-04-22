require "test_helper"

describe User do
  before do
    @user = User.new email: 'test@example.com', password: '12345678'
  end

  it "must be valid" do
    @user.valid?.must_equal true
  end
end
