class HomeController < ApplicationController

  def index
    @post = Post.published.first
    @albums = CACHE["lastfm_weekly_album_chart"]
  end
  
end
