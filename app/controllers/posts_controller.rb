class PostsController < ApplicationController

  def index
    @posts = Post.published.paginate :page => (params[:page] || 1), :include => :tags, :order => 'created_at DESC'

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

  def new
    @post = Post.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @post }
      format.json { render :json => @post }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
