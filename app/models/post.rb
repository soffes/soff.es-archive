class Post < ActiveRecord::Base
	validates_presence_of :body, :title
	has_many :comments
	
	def slug
		return read_attribute(:title).downcase.gsub(/[^ a-zA-Z0-9]/, '').gsub(/\s/, '-')
	end
end
