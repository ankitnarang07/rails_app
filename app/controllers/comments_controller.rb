class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(create_comment)
		if @comment.save
			flash[:success] = 'comment added successfully.'
		else
			flash[:danger] = 'comment not added'
		end	
		redirect_to post_path(@post)
	end

	private
	
	def create_comment
		params.require(:comment).permit(:name, :email, :comment)
	end
end
