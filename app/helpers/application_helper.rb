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

  def tag_cloud(tags, classes)
    max, min = 0, 0
    tags.each do |tag|
      count = tag.count.to_i
      max = count if count > max
      min = count if count < min
    end

    divisor = ((max - min) / classes.size) + 1

    tags.each do |tag|
      yield tag, classes[(tag.count.to_i - min) / divisor]
    end
  end
end
