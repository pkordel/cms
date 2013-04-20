require "test_helper"

describe Taxonomy do
  before do
    @taxonomy = Taxonomy.new
  end

  it "must be valid" do
    @taxonomy.valid?.must_equal true
  end
end
