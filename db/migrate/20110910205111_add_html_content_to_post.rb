require 'posts_helper'

class AddHtmlContentToPost < ActiveRecord::Migration
  extend PostsHelper

  def up
    add_column :posts, :html_content, :text
    Post.all.each do |post|

      # Re-set content so HTML will get stored in `html_content`
      post.content = post.content
      post.save
      say "#{tag.id} was updated"
    end
  end

  def down
    remove_column :posts, :html_content
  end
end
