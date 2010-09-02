module ApplicationHelper
  include TweetButton
  TweetButton.default_tweet_button_options = {
    :count => "horizontal",
    :text => Post::DEFAULT_TWEET_TEXT,
    :via => "samsoffes"
  }
  
  def podcast_url
    "http://itunes.apple.com/podcast/the-experiment/id292395055"
  end
  
  def tag_cloud(tags, classes)
    max, min = 0, 0
    tags.each do |tag|
      max = tag.count.to_i if tag.count.to_i > max
      min = tag.count.to_i if tag.count.to_i < min
    end

    divisor = ((max - min) / classes.size) + 1

    tags.each do |tag|
      yield tag, classes[(tag.count.to_i - min) / divisor]
    end
  end
end
