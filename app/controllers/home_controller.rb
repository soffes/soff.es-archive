class HomeController < ApplicationController

  def index
    @recent_post = Post.find(:all, :limit => 1).first
  end

end
