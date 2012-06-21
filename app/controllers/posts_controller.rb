class PostsController < ApplicationController
  respond_to :html, :xml, :json, :atom
  # caches_action :index, :show

  def index
    per_page = Post.per_page
    page = params[:page]
    
    # Serve more posts with atom and only page 1
    if params[:format] == 'atom'
      per_page = 25
      page = 1
    end
    
    respond_with @posts = Post.published.recent.page(page).per(per_page)
  end

  def show
    respond_with @post = Post.where(permalink: params[:id]).first
  end
end
