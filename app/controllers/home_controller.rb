class HomeController < ApplicationController

  def index
    @recent_post = Post.find(:all, :limit => 1, :order => "created_at DESC").first
  end

end
