class PagesController < ApplicationController
  def home
    render 'home', :layout => 'home'
  end
  
  def orange
    render 'orange', :layout => nil
  end
end
