class PostsController < ApplicationController
  respond_to :html, :xml, :json, :atom
  # caches_action :index, :show

  def index
    per_page = Post.per_page
    page = params[:page]

    if params[:format] == 'rss'
      redirect_to posts_url(format: 'atom') and return
    end

    # Serve more posts with atom and only page 1
    if params[:format] == 'atom'
      per_page = 25
      page = 1
    end

    # Search
    if params[:search]
      @posts = Post.search(params)
    else
      @posts = Post.published.recent.page(page).per(per_page)
    end

    respond_with @posts
  end

  def show
    @post = Post.where(permalink: params[:permalink]).first
    raise NotFoundError unless @post
    respond_with @post
  end
end
