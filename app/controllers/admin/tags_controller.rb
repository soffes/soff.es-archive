class Admin::TagsController < AdminController
  before_filter :find_tag, :only => [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = 'Successfully created tag.'
      redirect_to @tag
    else
      render 'new'
    end
  end

  def update
    if @tag.update_attributes(params[:tag])
      flash[:notice] = 'Successfully updated tag.'
      redirect_to @tag
    else
      render 'edit'
    end
  end

  def destroy
    @tag.destroy
    flash[:notice] = 'Successfully destroyed tag.'
    redirect_to tags_url
  end

  protected

  def find_tag
    @tag = Tag.find(params[:id])
  end

end
