class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :headword
      t.string :clarification
      t.text :xhtml
      t.hstore :metadata

      t.timestamps
    end
  end
end
