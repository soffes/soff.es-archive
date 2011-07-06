class PagesController < ApplicationController
  def home
    @recent_post = Post.published.first
    render 'home', :layout => 'abstract'
  end
  
  def orange
    render 'orange', :layout => nil
  end
end
