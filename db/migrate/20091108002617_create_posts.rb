class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :active
      t.timestamps
    end
    
    add_index :posts, [:id], :name => "index_posts_on_id"
  end
  
  def self.down
    drop_table :posts
  end
end
