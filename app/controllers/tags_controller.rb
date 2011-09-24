class TagsController < ApplicationController
  respond_to :html, :xml, :json

  def index
    respond_with @tags = Tag.includes(:taggings).all
  end

  def show
    id = params[:id].downcase

    # Find tag
    @tag = Tag.where(:name => id).includes(:posts).first
    redirect_to tags_url and return unless @tag

    # Get posts for tag
    respond_with @posts = @tag.posts.published.page(params[:page]).per(Post.per_page)
  end
end
