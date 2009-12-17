class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :post_id
      t.string :author_name
      t.string :author_email
      t.string :author_website
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :comments
  end
end
