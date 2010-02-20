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
    @posts = @tag.posts.paginate :page => (params[:page] || 1), :include => :tags, :order => 'created_at DESC'

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end

end
