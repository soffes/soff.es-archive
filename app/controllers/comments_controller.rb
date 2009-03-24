class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(params[:comment])
		@comment.request = request
		if @comment.save
		  if @comment.approved?
		    #CommentsMailer.deliver_new_comment(@comment)
		    flash[:notice] = "Thanks for the comment."
		  else
		    flash[:error] = "Akismet this this comment is spam. It will show up once Sam looks at it."
		  end
		  respond_to do |format|
			  format.html { redirect_to @post }
			  format.js
		  end
		else
		  render :action => 'new'
		end
	end
end
