class TagsController < ApplicationController
  def index
    @tags = Tag.includes(:taggings).all

    respond_to do |format|
      format.html
      format.xml  { render xml: @tags }
      format.json { render json: @tags }
    end
  end

  def show
    id = params[:id].downcase

    # Find tag
    @tag = Tag.where(name: id).includes(:posts).first
    redirect_to tags_url and return unless @tag

    # Get posts for tag
    @posts = @tag.posts.published.page(params[:page]).per(Post.per_page)

    respond_to do |format|
      format.html
      format.xml  { render xml: @posts }
      format.json { render json: @posts }
    end
  end
end
