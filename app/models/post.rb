class Post < ActiveRecord::Base
  attr_accessible :title, :content, :active
  has_many :comments
end
