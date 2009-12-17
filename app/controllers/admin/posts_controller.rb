class Admin::PostsController < AdminController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find_by_permalink(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to [:admin, @post]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @post = Post.find_by_permalink(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to [:admin, @post]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to admin_posts_url
  end
end
