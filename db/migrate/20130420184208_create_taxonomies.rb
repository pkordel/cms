class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.string :ancestry
      t.integer :position, default: 0
      t.belongs_to :authoritative_editor
      t.timestamps
    end
  end
end
