class Post < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  validates_presence_of :title, :published_at, :content
  attr_writer :tag_names

  before_save :render_html
  after_save :assign_tags

  scope :published, lambda { where('published_at <= ?', Time.now.utc) }
  scope :unpublished, lambda { where('published_at > ?', Time.now.utc) }
  scope :recent, order('published_at DESC')

  mapping do
    indexes :id, type: 'integer'
    indexes :title, boost: 10
    indexes :content, analyzer: 'snowball'
    indexes :published_at, type: 'date'
  end

  def self.per_page
    3
  end

  def self.search(params)
    options = {
      load: true,
      deafult_operator: 'AND',
      page: params[:page],
      per_page: self.per_page
    }

    tire.search(options) do
      query { string params[:search] if params[:search].present? }

      # Only published posts
      filter :range, published_at: { lte: Time.zone.now }

      # Most recent posts first if there's no search
      sort { by :published_at, 'desc' } if params[:search].blank?
    end
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

  def is_link?
    !self.link.blank?
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
