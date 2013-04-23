class Taxonomy < ActiveRecord::Base
  has_ancestry
  belongs_to :authoritative_editor, class_name: 'User', inverse_of: :taxonomies
  has_many :articles, inverse_of: :taxonomy
end
