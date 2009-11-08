class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :post_id
      t.string :name
      t.string :email
      t.string :site_url
      t.text :content
      t.string :user_ip
      t.string :user_agent
      t.string :referrer
      t.timestamps
    end
    
    add_index :comments, [:post_id], :name => "index_comments_on_post_id"
  end
  
  def self.down
    drop_table :comments
  end
end
