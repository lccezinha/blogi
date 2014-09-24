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

  describe 'GET #new' do
    it 'responds suceffull with HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'render the index template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'have a new object' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    context 'when new post is create successfully' do
      let(:author) { build(:author) }
      let(:category) { build(:category) }

      it do
        post :create, post: { title: 'Random', description: 'HAHA HUE BR', author_id: author.id, category_id: category.id }

        expect(response).to redirect_to('posts/index')
      end
    end
  end

end
