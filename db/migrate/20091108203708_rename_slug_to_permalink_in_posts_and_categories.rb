class RenameSlugToPermalinkInPostsAndCategories < ActiveRecord::Migration
  def self.up
    rename_column(:posts, :slug, :permalink)
    rename_column(:categories, :slug, :permalink)
  end

  def self.down
    rename_column(:posts, :permalink, :slug)
    rename_column(:categories, :permalink, :slug)
  end
end
