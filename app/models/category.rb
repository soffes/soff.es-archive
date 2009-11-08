class Category < ActiveRecord::Base
  attr_accessible :name, :permalink
  has_many :posts
end
