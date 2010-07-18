class HomeController < ApplicationController

  def index
    @post = Post.published.first
    @albums = Rails.cache.read("lastfm_weekly_album_chart")
    @albums = @albums[0..1] if is_iphone?
  end
  
  def source
    path = params[:code_path] ? "/tree/master/#{params[:code_path]}" : ""
    redirect_to "http://github.com/samsoffes/samsoff.es#{path}" and return
  end
  
end
