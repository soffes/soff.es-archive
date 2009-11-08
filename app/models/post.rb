class Post < ActiveRecord::Base

  attr_accessible :title, :content, :permalink, :category_id, :active
  cattr_reader :per_page
  
  has_many :comments, :dependent => :destroy
  belongs_to :category
  
  validates_presence_of :title, :content, :permalink
  validates_uniqueness_of :permalink  
  
  before_validation :generate_permalink

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
  
  def to_param
    permalink
  end
  
  protected
  
  def generate_permalink
    self.permalink = title.downcase.gsub('\'', '').gsub(/[^0-9a-z]+/, ' ').strip.gsub(/\s+/, '-')
  end

end
