class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	user = User.create(post_params)
  	session[:user_id] = user.id
  	redirect_to posts_path
  end

  private
    def post_params
      params.require(:user).permit(:email, :password)
    end

end
