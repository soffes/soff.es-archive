class AddShortUrlToPost < ActiveRecord::Migration
  def up
    add_column :posts, :short_url, :string
    add_column :posts, :tweet_text, :string
    add_column :posts, :homepageable, :boolean, :default => true

    Post.all.each do |post|
      post.homepageable = true
      post.save
      say "#{post.id} was updated"
    end
  end

  def down
    remove_column :posts, :short_url
  end
end
