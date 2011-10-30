class AddPermalinkToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :permalink, :string, :limit => 128
  end
end
