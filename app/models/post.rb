class Post < ActiveRecord::Base

  attr_accessible :title, :content, :active

  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :content, :slug

end
