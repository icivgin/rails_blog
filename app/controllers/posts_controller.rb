class PostsController < ApplicationController
  
  def index
  	@allPosts = Post.all
  end

  def new
  	@post = Post.new
  end

  def destroy
  	Post.destroy(params[:id])
  	redirect_to posts_path
  end

  def create
  	post = Post.create(post_params)
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
  	p "test: #{post_params[:title]}"
  	@post = Post.find(params[:id])
  	@post.update_attributes(post_params)
  	redirect_to posts_path
  end


  private
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
