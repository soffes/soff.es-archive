class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :posts, :through => :taggings

  def self.with_names(names)
    names.map do |name|
      Tag.find_or_create_by_name(name)
    end
  end

  def to_param
    name
  end

  def name=(string)
    write_attribute :name, string.downcase
    string.downcase
  end

  def count
    posts.length
  end
end
