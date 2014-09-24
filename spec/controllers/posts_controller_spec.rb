require 'rails_helper'

RSpec.describe PostsController, :type => :controller do

  describe 'GET #index' do
    it 'responds suceffull with HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'load all posts' do
      posts_one = create(:post)
      posts_two = create(:post)

      posts = [posts_one, posts_two]

      get :index
      expect(assigns(:posts)).to match_array(posts)
    end

  end

end
