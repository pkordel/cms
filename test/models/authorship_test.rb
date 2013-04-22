require "test_helper"

describe Authorship do
  before do
    @authorship = Authorship.new
  end

  it "must be valid" do
    @authorship.valid?.must_equal true
  end
end
