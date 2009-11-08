class Comment < ActiveRecord::Base

  attr_accessible :post_id, :name, :email, :site_url, :content, :user_ip, :user_agent, :referrer

  belongs_to :post
  validates_presence_of :name, :content, :post_id
  named_scope :recent, :order => "created_at DESC"
  before_save :add_protocol_to_site_url
  
  def request=(request)
    self.user_ip    = request.remote_ip
    self.user_agent = request.env['HTTP_USER_AGENT']
    self.referrer   = request.env['HTTP_REFERER']
  end
  
  private

  def add_protocol_to_site_url
    self.site_url = "http://#{site_url}" unless site_url.blank? || site_url.include?('://')
  end
  
end
