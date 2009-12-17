# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def blog_feed_url
    "http://feeds.feedburner.com/samsoffes/blog"
  end
  
  def podcast_feed_url
    "http://feeds.feedburner.com/samsoffes/the-experiment"
  end
end
