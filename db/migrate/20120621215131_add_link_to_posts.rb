class AddLinkToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :link, :string
  end
end
