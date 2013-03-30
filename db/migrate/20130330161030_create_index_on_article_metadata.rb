class CreateIndexOnArticleMetadata < ActiveRecord::Migration
  def up
    execute 'CREATE INDEX articles_gin_metadata ON articles USING GIN(metadata)'
  end
  def down
    execute 'DROP INDEX articles_gin_metadata'
  end
end
