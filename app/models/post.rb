class Post < ActiveRecord::Base
  attr_accessible :title, :permalink, :body, :type, :published_at
end
