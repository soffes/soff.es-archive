class Comment < ActiveRecord::Base
  attr_accessible :post_id, :name, :email, :site_url, :content, :user_ip, :user_agent, :referrer
  belongs_to :post
end
