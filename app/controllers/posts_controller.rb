class PostsController < ApplicationController

  def index
  	@allPosts = Post.all
  end

  def new
  	@post = Post.new
  end

  def destroy
    post = Post.find_by_id(params[:id])

    if current_user && current_user[:id] == post[:user_id]
  	  Post.destroy(params[:id])
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  def create
  	post = Post.new(post_params)
    p session[:user_id]
    post[:user_id] = current_user[:id]

    post.save
  	redirect_to posts_path
  end

  def show
  	# @post = {title: "hey", content: "this is some content bitch"}

  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
    post = Post.find_by_id(params[:id])
    if current_user && current_user[:id] == post[:user_id]
  	   @post = Post.find(params[:id])
  	   @post.update_attributes(post_params)
    end
  	redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
