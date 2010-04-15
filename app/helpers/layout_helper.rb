module LayoutHelper
  def title(page_title, show_title = true)
    content_for(:title) { page_title.to_s }
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def google_analytics(account, always = false)
    # This helper should be called at end of the <head> tag
    "<script>var _gaq=_gaq || [];_gaq.push(['_setAccount','#{account}']);_gaq.push(['_trackPageview']);(function(){var ga=document.createElement('script');ga.async=true;ga.src=('https:'==document.location.protocol?'https://ssl':'http://www')+'.google-analytics.com/ga.js';(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);})();</script>".html_safe if (always || Rails.env.to_sym == :production)
  end
  
  def twitter_anywhere(api_key)
    "<script src=\"http://platform.twitter.com/anywhere.js?id=#{api_key}&v=1\"></script><script type=\"text/javascript\">twttr.anywhere(function(twitter){twitter.hovercards({infer:true});});</script>".html_safe
  end
end
