class RemoveShortUrlFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :short_url
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
