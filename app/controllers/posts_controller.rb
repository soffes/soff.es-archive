class PostsController < ApplicationController
  exposes_xmlrpc_methods :method_prefix => 'metaWeblog.'

  def index
    @posts = Post.published.paginated(params[:page])
  
    respond_to do |format|
      format.html
      format.xml  { render :xml => @posts }
      format.json { render :json => @posts }
      format.atom
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
  
  # MetaWeblog
  
  def getRecentPosts(blogid, username, password, numberOfPosts)
    render :status => :forbidden and return false unless (username == ADMIN_USERNAME && password == ADMIN_PASSWORD)
    
    @posts = Post.published.limit(numberOfPosts)
    puts render_to_string :template => 'posts/rss.xml'
  end
end
