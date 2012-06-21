class Post < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates_presence_of :title, :published_at, :content
  attr_writer :tag_names

  before_save :render_html
  after_save :assign_tags

  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')

  def self.per_page
    3
  end

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end

  def to_param
    self.permalink
  end

  def published?
    published_at < Time.now
  end

  def unpublished?
    !published?
  end

  def last_published?
    self == self.class.published.last
  end

  def previous
    self.class.where('published_at < ?', published_at).order('published_at DESC').first
  end

  def next
    self.class.where('published_at > ?', published_at).order('published_at ASC').first
  end

  private

  def render_html
    options = {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,      
      strikethrough: true,
      space_after_headers: true,
      superscript: true
    }
    markdown = Redcarpet::Markdown.new(SamSoffes::MarkdownRenderer, options)    
    self.html_content = markdown.render(self.content)
  end

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name.gsub(',', ''))
      end
    end
  end
end
