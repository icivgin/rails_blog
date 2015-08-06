require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "GET #index" do
		it "should assign @posts" do
			get :index
			expect(assigns(:allPosts)).to eq(Post.all)
		end

		it "should render the :index view" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "GET #new" do
      it "should assign @post" do
        get :new
        expect(assigns(:post)).to be_instance_of(Post)
      end

      it "should render the :new view" do
        get :new
        expect(response).to render_template(:new)
      end
    end

end