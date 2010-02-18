class Post < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  validates_presence_of :title, :content
  attr_writer :tag_names
  after_save :assign_tags

  @@per_page = 3
  cattr_reader :per_page

  # This could be dangerous. There is a better way.
  include ActionView::Helpers::DateHelper

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  # def to_param
  #   self.permalink
  # end

  def to_html
    content.blank? ? "" : RDiscount.new(content).to_html
  end
  
  def excerpt
    to_html.split("</p>").first+"</p>"
  end
  
  # def published?
  #   published_at < Time.now
  # end
  # 
  # def unpublished?
  #   !published?
  # end
  # 
  # def published_time_in_words
  #   words = time_ago_in_words(published_at)
  #   if published?
  #     "#{words} ago"
  #   else
  #     "in #{words}"
  #   end
  # end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end
