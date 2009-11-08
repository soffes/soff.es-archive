class AddCategoryIdToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :category_id, :integer
    add_index :posts, [:category_id], :name => :index_posts_on_category_id
  end

  def self.down
    remove_column :posts, :category_id
    remove_index :index_posts_on_category_id
  end
end
