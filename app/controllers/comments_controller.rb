class CommentsController < ApplicationController
  
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment])
		@comment.request = request
		@status = "error"
		
		if @comment.save
		  if @comment.approved?
		    
		    # Clear cache of post's page
		    #expire_page :controller => 'posts', :action => 'show', :id => @comment.post.id
		    #expire_page :controller => 'posts', :action => 'show', :slug => @comment.post.slug
		    
		    CommentsMailer.deliver_new_comment(@comment)
		    flash.now[:notice] = "Thanks for the comment. You are awesome."
		    @status = "success"
		    respond_to do |format|
  			  format.html { redirect_to @post }
  			  format.js
  		  end
		  else
		    flash.now[:error] = "This looks spammy. Sam will have to take a look."
		    @status = "spam"
		    respond_to do |format|
  			  format.html
  			  format.js
  		  end
		  end
		else
		  respond_to do |format|
			  format.html
			  format.js
		  end
		end
	end
end
