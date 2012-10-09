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

  def follow_button(options = {})
    options_string = options.map { |key, value| "data-#{key}=\"#{value}\"" }.join(' ')
    options_string = " #{options_string}" if options_string.length > 0

    %Q{<a href="https://twitter.com/soffes" class="twitter-follow-button" data-show-count="false"#{options_string}>Follow @soffes</a>
    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>}.html_safe
  end

  def gauges(code)
    %Q{<script type="text/javascript">var _gauges=_gauges||[];(function(){var t=document.createElement('script');t.async=true;t.id='gauges-tracker';t.setAttribute('data-site-id','#{code}');t.src='//secure.gaug.es/track.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(t, s);})();</script>}.html_safe if Rails.env.production?
  end
end
