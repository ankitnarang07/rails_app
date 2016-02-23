class PostsController < ApplicationController
	before_filter :check_login , :except => [:show]
	def index
		@user = current_user
	end

	def new
		@post = Post.new	
	end
	
	def create
		@user = current_user
		@post = @user.posts.new(create_post)

		if @post.save
			flash[:success] = "Post Added!"
			redirect_to posts_path
		else 
			flash[:danger] = "Post not Added!"
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end
	
	def edit
		@post =Post.find(params[:id])
		if @post.user_id != current_user.id
			redirect_to posts_path;
		end	
	end
	
	def update
		@post =Post.find(params[:id])

		@post.update(create_post)
		redirect_to posts_path
	end	
	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to posts_path	

	end
		
	def check_login
		if !user_signed_in?
			redirect_to root_path
		end
	end
		
	private
	
	def create_post
		params.require(:post).permit(:title, :description)
	end	
end
