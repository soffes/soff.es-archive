class PagesController < ApplicationController
  def home
    @post = Post.published.where(:homepageable => true).first
    @albums = Marshal.load($redis[:lastfm_weekly_album_chart])
    @albums = @albums[0..1] if @albums && is_iphone?
    render 'home', :layout => 'abstract'
  end
  
  def orange
    render 'orange', :layout => nil
  end
  
  def hello_internet
    # Find tag
    @tag = Tag.where(:name => 'hello-internet').includes(:posts).first
    redirect_to tags_url and return unless @tag

    # Get posts for tag
    @posts = @tag.posts.published.paginated(params[:page])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
    end
  end
  
  def work
    redirect_to "http://github.com/samsoffes" and return
  end
end
