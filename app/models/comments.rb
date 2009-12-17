class Comments < ActiveRecord::Base
  attr_accessible :post_id, :author_name, :author_email, :author_website, :content
  belongs_to :post
end
