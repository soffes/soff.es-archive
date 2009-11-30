class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings, :dependent => :destroy
  has_many :posts, :through => :taggings
  before_save :set_permalink_safe_name
  
  def to_param
    self.name
  end
  
  def set_permalink_safe_name
    self.name = name.downcase.gsub(/[^0-9a-z]+/, ' ').strip.gsub(' ', '-') if name
  end
end
