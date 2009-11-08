class Post < ActiveRecord::Base

  attr_accessible :title, :content, :slug, :active

  has_many :comments, :dependent => :destroy
  validates_presence_of :title, :content, :slug
  validates_uniqueness_of :slug
  cattr_reader :per_page

  @@per_page = 3

  def approved_comments
    Comment.approved_by_post(self)
  end
  
  def self.search(search = nil, page = 1)
    conditions = nil
    if search
      sanitized = self.class.sanitize(search)
      conditions = "title LIKE #{sanitized} OR content LIKE #{sanitized}"
    end
    
    paginate :page => page, :conditions => conditions, :order => "created_at DESC"
  end

end
