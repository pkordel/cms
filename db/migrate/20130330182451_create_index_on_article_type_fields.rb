class CreateIndexOnArticleTypeFields < ActiveRecord::Migration
  def up
    execute 'CREATE INDEX article_types_gin_fields ON article_types USING GIN(fields)'
  end
  def down
    execute 'DROP INDEX article_types_gin_fields'
  end
end
