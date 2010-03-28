class TagsController < ApplicationController

  def index
    @tags = Tag.includes(:taggings).all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @tags }
      format.json { render :json => @tags }
    end
  end

  def show
    # Find tag
    @tag = Tag.where(:name => params[:id].downcase).includes(:posts).first
    redirect_to tags_url and return unless @tag

    # Redirect to tag if case doesn't match
    redirect_to @tag and return unless @tag.name == params[:id]
    
    # Get posts for tag
    @posts = @tag.posts.published.paginated(params[:page])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end

end
