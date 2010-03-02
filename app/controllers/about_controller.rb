class AboutController < ApplicationController
  
  def index
    @albums = CACHE["lastfm_weekly_album_chart"]
  end

end
