class Post < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  attr_writer :tag_names

  before_save :render_html
  after_save :assign_tags

  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, lambda { order('published_at DESC') }

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
    return false unless published_at
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

  def is_link?
    !self.link.blank?
  end

  private

  def render_html
    if !self.content or self.content.length == 0
      self.html_content = ''
      return
    end

    options = {
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      autolink: true,
      strikethrough: true,
      space_after_headers: true,
      superscript: true
    }
    markdown = Redcarpet::Markdown.new(Soffes::MarkdownRenderer, options)
    self.html_content = markdown.render(self.content)
  end

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by name: name.gsub(',', '')
      end
    end
  end
end
