module ApplicationHelper
  include TweetButton
  TweetButton.default_tweet_button_options = {
    count: 'horizontal',
    text: 'This will blow your face off with awesome',
    via: 'samsoffes'
  }

  def podcast_url
    'http://itunes.apple.com/podcast/the-experiment/id292395055'
  end

  def github_url
    'http://github.com/samsoffes'
  end

  def dribbble_url
    'http://dribbble.com/players/samsoffes'
  end
  
  def gauges(code)
    %W{<script type="text/javascript">var _gauges=_gauges||[];(function(){var t=document.createElement('script');t.async=true;t.id='gauges-tracker';t.setAttribute('data-site-id','#{code}');t.src='//secure.gaug.es/track.js';var s=document.getElementsByTagName('script')[0];s.parentNode.insertBefore(t, s);})();</script>}.html_safe if Rails.env.production?    
  end
end
