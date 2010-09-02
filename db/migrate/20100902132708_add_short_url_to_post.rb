class AddShortUrlToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :short_url, :string
    add_column :posts, :tweet_text, :string
    add_column :posts, :homepageable, :boolean, :default => true
    
    Post.update_all(:homepageable => true)
  end

  def self.down
    remove_column :posts, :short_url
  end
end
