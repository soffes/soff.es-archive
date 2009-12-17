class Admin::CommentsController < AdminController
  def index
    @comments = Comments.all
  end
  
  def show
    @comments = Comments.find(params[:id])
  end
  
  def new
    @comments = Comments.new
  end
  
  def create
    @comments = Comments.new(params[:comments])
    if @comments.save
      flash[:notice] = "Successfully created comments."
      redirect_to @comments
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comments = Comments.find(params[:id])
  end
  
  def update
    @comments = Comments.find(params[:id])
    if @comments.update_attributes(params[:comments])
      flash[:notice] = "Successfully updated comments."
      redirect_to @comments
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comments = Comments.find(params[:id])
    @comments.destroy
    flash[:notice] = "Successfully destroyed comments."
    redirect_to comments_url
  end
end
