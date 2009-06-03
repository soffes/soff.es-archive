class Comment < ActiveRecord::Base
	belongs_to :post
	validates_presence_of :name, :email, :body
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	before_create :check_for_spam
	
	def self.approved
	  find(:all, :conditions => 'approved=1', :order => 'created_at')
	end
	
	def request=(request)
	  self.user_ip    = request.remote_ip
	  self.user_agent = request.env['HTTP_USER_AGENT']
	  self.referrer   = request.env['HTTP_REFERER']
	end
	
	def check_for_spam
	  self.approved = !Akismetor.spam?(akismet_attributes)
	  true
	end
	
	def akismet_attributes
	  {
	    :key                  => 'd064bb9b5965',
	    :blog                 => 'http://samsoff.es',
	    :user_ip              => user_ip,
	    :user_agent           => user_agent,
	    :comment_author       => name,
	    :comment_author_email => email,
	    :comment_author_url   => website,
	    :comment_content      => body
	  }
	end
	
	def mark_as_spam!
	  update_attribute(:approved, false)
	  Akismetor.submit_spam(akismet_attributes)
	end
	
	def mark_as_ham!
	  update_attribute(:approved, true)
	  Akismetor.submit_ham(akismet_attributes)
	end
end
