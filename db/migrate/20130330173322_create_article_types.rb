class CreateArticleTypes < ActiveRecord::Migration
  def change
    create_table :article_types do |t|
      t.string :name
      t.hstore :fields

      t.timestamps
    end
  end
end
