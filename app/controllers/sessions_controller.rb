class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.find_by(email: post_params[:email]).try(:authenticate, post_params[:password])
		if user
			session[:user_id] = user.id
			redirect_to posts_path
		else
			@error = 'There was an error logging in. Please try again.'
			@user = User.new
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to posts_path
	end

	private
	    def post_params
	      params.require(:user).permit(:email, :password)
	    end
end
