require 'net/http'
require 'uri'

class Post < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_presence_of :title, :content
  attr_writer :tag_names
  
  before_save do |post| 
    rc_options = [:hard_wrap, :autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]
    doc = Nokogiri::HTML(Redcarpet.new(post.content, *rc_options).to_html)
    doc.search("//pre[@lang]").each do |pre|
        pre.replace Net::HTTP.post_form(URI.parse('http://pygments-1-4.appspot.com/'),
                                        {'lang'=>pre[:lang], 'code'=>pre.text.strip}).body
    end
    post.html_content = doc.css('body > *').to_s
  end
  
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
