class Post < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates_presence_of :title, :published_at, :content
  attr_writer :tag_names

  before_save :color_code
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

  def color_code
    rc_options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    doc = Nokogiri::HTML(Redcarpet.new(self.content, *rc_options).to_html)
    doc.search("//pre[@lang]").each do |pre|
      pre.replace Pygmentize.process(pre.text.strip, pre[:lang].to_sym)
    end
    self.html_content = doc.css('body > *').to_s
  end

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name.gsub(',', ''))
      end
    end
  end
end
