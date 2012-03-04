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
end
