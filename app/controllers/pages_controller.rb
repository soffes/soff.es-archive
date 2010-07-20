class PagesController < ApplicationController
  
  def orange
    render "orange", :layout => nil
  end
  
  def hello_internet
    # Find tag
    @tag = Tag.where(:name => "hello-internet").includes(:posts).first
    redirect_to tags_url and return unless @tag

    # Get posts for tag
    @posts = @tag.posts.published.paginated(params[:page])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end
end
