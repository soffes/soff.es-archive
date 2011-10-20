class PostsController < ApplicationController
  respond_to :html, :xml, :json, :atom

  def index
    per_page = params[:format] == 'atom' ? 25 : Post.per_page
    respond_with @posts = Post.published.recent.page(params[:page]).per(per_page)
  end

  def show
    respond_with @post = Post.where(permalink: params[:id]).first
  end
end
