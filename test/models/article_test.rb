require "test_helper"

describe Article do

  let(:article) { Article.new }

  it "must be valid" do
    article.valid?.must_equal true
  end
end
