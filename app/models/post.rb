class Post < ActiveRecord::Base
  
  named_scope :published, lambda { {:conditions => ['published_at <= ?', Time.now.utc]} }
  named_scope :unpublished, lambda { {:conditions => ['published_at > ?', Time.now.utc]} }
  named_scope :recent, :order => 'published_at DESC'
  
end
