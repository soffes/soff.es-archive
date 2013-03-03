class Admin::PostsController < AdminController
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.recent.page(params[:page])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = 'Successfully created post.'
      redirect_to [:admin, @post]
    else
      render 'new'
    end
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Successfully updated post.'
      redirect_to [:admin, @post]
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Successfully destroyed post.'
    redirect_to admin_posts_url
  end

  protected

  def find_post
    @post = Post.find_by_permalink(params[:id])
  end
end
