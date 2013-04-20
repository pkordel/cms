class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.string :ancestry
      t.timestamps
    end
  end
end
