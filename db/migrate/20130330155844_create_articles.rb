class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.hstore :metadata

      t.timestamps
    end
  end
end
