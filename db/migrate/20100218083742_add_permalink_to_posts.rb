class AddPermalinkToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :permalink, :string, :limit => 128
  end

  def self.down
    remove_column :posts, :permalink
  end
end
