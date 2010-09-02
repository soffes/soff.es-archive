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
  
  def google_analytics account = GOOGLE_ANALYTICS_KEY, always = false
    # This helper should be called at end of the <head> tag
    "<script>var _gaq=_gaq || [];_gaq.push(['_setAccount','#{account}']);_gaq.push(['_trackPageview']);(function(){var ga=document.createElement('script');ga.async=true;ga.src=('https:'==document.location.protocol?'https://ssl':'http://www')+'.google-analytics.com/ga.js';(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga);})();</script>".html_safe if (always || Rails.env.to_sym == :production)
  end
  
  def observer_app key = OBSERVER_APP_KEY, always = false
    "<script src=\"http://www.observerapp.com/record.js\"></script><script>Observerapp.record('#{key}');</script>".html_safe if (always || Rails.env.to_sym == :production)
  end
  
  def twitter_anywhere(api_key)
    "<script src=\"http://platform.twitter.com/anywhere.js?id=#{api_key}&v=1\"></script><script type=\"text/javascript\">twttr.anywhere(function(twitter){twitter.hovercards({infer:true});});</script>".html_safe
  end
  
  def like_button(url)
    "<iframe src=\"http://www.facebook.com/plugins/like.php?href=#{CGI::escape(url)}&amp;layout=button_count&amp;show_faces=false&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=21\" scrolling=\"no\" frameborder=\"0\" style=\"border:none; overflow:hidden; width:450px; height:21px;\" allowTransparency=\"true\"></iframe>".html_safe
  end
end
