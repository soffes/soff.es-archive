class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :posts, :through => :taggings
  
  def to_param
    name
  end
  
  def name=(string)
    write_attribute :name, string.downcase
    string.downcase
  end
  
end
