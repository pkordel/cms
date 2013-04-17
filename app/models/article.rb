class Article < ActiveRecord::Base
  hstore_accessor :metadata, :tag, :pronunciation, :etymology, :alternative_form
end
