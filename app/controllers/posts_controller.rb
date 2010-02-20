class PostsController < ApplicationController

  def index
    @posts = Post.published.paginate :page => (params[:page] || 1), :include => :tags, :order => 'created_at DESC', :per_page => Post.per_page

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end

  def show
    @post = Post.published.where(:permalink => params[:id]).first

    respond_to do |format|
      format.html
      format.xml  { render :xml => @post }
      format.json { render :json => @post }
    end
  end

end
