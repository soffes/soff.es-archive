class Post < ActiveRecord::Base
	validates_presence_of :title, :slug, :body
	validates_uniqueness_of :slug
	has_many :comments
	
#	def slug
#		return read_attribute(:title).downcase.gsub(/[^ a-zA-Z0-9]/, '').gsub(/\s/, '-')
#	end
end
