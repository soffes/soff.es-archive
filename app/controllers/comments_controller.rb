class CommentsController < ApplicationController
  
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment])
		@comment.request = request
		
		if @comment.save
		  if @comment.approved?
		    
		    # Clear cache of post's page
		    expire_page :controller => 'posts', :action => 'show', :id => @comment.post.id
		    expire_page :controller => 'posts', :action => 'show', :slug => @comment.post.slug
		    
		    #CommentsMailer.deliver_new_comment(@comment)
		    flash.now[:notice] = "Thanks for the comment."
		    respond_to do |format|
  			  format.html { redirect_to @post }
  			  format.js
  		  end
		  else
		    flash.now[:error] = "Akismet thinks this comment is spam. It will show up once Sam looks at it."
		  end
		else
		  render :action => 'new'
		end
	end
end
