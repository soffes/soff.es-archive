class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_presence_of :title, :content
  attr_writer :tag_names
  after_save :assign_tags

  def self.published
    where('published_at < ?', Time.zone.now).order('published_at DESC')
  end
  
  def self.per_page
    3
  end
  
  def self.paginated page = 1
    paginate page: (page), include: :tags, per_page: per_page
  end

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  def to_param
    self.permalink
  end
  
  def published?
    published_at && published_at < Time.now
  end
  
  def unpublished?
    !published?
  end
  
  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name.gsub(',', ''))
      end
    end
  end
end
