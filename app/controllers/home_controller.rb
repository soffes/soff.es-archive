class HomeController < ApplicationController

  def index
    @post = Post.published.first
    @albums = Rails.cache.read("lastfm_weekly_album_chart")
  end
  
end
