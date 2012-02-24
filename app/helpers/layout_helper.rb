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

  def like_button(url)
    "<iframe src=\"http://www.facebook.com/plugins/like.php?href=#{CGI::escape(url)}&amp;layout=button_count&amp;show_faces=false&amp;width=450&amp;action=like&amp;colorscheme=light&amp;height=21\" scrolling=\"no\" frameborder=\"0\" id=\"facebook-like-button\" style=\"border:none; overflow:hidden; height:21px;\" allowTransparency=\"true\"></iframe>".html_safe
  end
end
