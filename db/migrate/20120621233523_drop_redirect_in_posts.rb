class DropRedirectInPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :redirect
  end
end
