class RemoveTypeFromPosts < ActiveRecord::Migration
  def self.up
    remove_column :posts, :type
  end

  def self.down
    add_column :posts, :type, :integer
  end
end
