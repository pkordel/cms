require "test_helper"

describe ArticleType do
  before do
    @article_type = ArticleType.new
  end

  it "must be valid" do
    @article_type.valid?.must_equal true
  end
end
