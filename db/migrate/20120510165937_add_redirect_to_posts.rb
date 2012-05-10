class AddRedirectToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :redirect, :string
  end
end
