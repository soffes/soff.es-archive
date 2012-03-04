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
  
  def follow_button
    %Q{<a href="https://twitter.com/samsoffes" class="twitter-follow-button" data-show-count="false">Follow @samsoffes</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>}.html_safe
  end
  
  def zerply_button
    %Q{<script type="text/javascript" src="http://get.zerply.com/js/zebtn/remote.js"></script><script type="text/javascript">button = new zerplyEB({container: 'ZE-button', key: '7f1b8344c499f5eaed9bcf833ac64c46'}); button.init();</script><div id="ZE-button"></div>}.html_safe    
  end
  
  def gauges(code)
    %W{<script type="text/javascript">var _gauges=_gauges||[];(function(){var t=document.createElement('script');t.async=true;t.id='gauges-tracker';t.setAttribute('data-site-id','#{code}');t.src='//secure.gaug.es/track.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(t, s);})();</script>}.html_safe if Rails.env.production?    
  end
end
