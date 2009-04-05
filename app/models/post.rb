class Post < ActiveRecord::Base
  validates_presence_of :title, :slug, :body
	validates_uniqueness_of :slug
	has_many :comments
	
	cattr_reader :per_page
	@@per_page = 5
	
#  def slug 
#    read_attribute(:title).downcase.gsub(/[^ a-zA-Z0-9]/, '').gsub(/\s/, '-')
#  end

  def self.search(search, page)
    paginate :page => page,
      :conditions => ['title like ? OR body like ?', "%#{search}%", "%#{search}%"],
      :order => 'created_at DESC'
  end
end
