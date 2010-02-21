class TagsController < ApplicationController

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.xml  { render :xml => @tags }
      format.json { render :json => @tags }
    end
  end

  def show
    @tag = Tag.where(:name => params[:id]).first
    @posts = @tag.posts.published.paginated(params[:page])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end

end
