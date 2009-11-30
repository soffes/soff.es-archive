# These helper methods can be called in your template to set variables to be used in the layout
# This module should be included in all views globally,
# to do so you may need to add this line to your ApplicationController
#   helper :layout
module LayoutHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end
  
  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
  
  def feed_tag(title, url, type = "application/atom+xml")
    "<link href=\"#{url}\" rel=\"alternate\" title=\"#{title}\" type=\"#{type}\" />"
  end

  def google_analytics(id, always = false)
    # By default, only return Google Analytics code if in production
    # This can be overridden but passing true for the second argument
    "<script type=\"text/javascript\">var gaJsHost=((\"https:\"==document.location.protocol)?\"https://ssl.\":\"http://www.\");document.write(unescape(\"%3Cscript src='\"+gaJsHost+\"google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E\"));</script><script type=\"text/javascript\">try{var pageTracker=_gat._getTracker(\"#{id}\");pageTracker._trackPageview();}catch(err){}</script>" if (always || Rails.env.to_sym == :production)
  end
end
