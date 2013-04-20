class AddTaxonomyIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :taxonomy_id, :integer
  end
end
