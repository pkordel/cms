class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.hstore :metadata
      t.belongs_to :creator, index: true
      t.belongs_to :taxonomy, index: true

      t.timestamps
    end
  end
end
