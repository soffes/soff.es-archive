class HomeController < ApplicationController

  layout "abstract"

  def index
    @post = Post.published.first
    @albums = Rails.cache.read("lastfm_weekly_album_chart")
    @albums = @albums[0..1] if is_iphone?
  end
    
end
