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

    it 'load all authors' do
      author_one = create(:author)
      author_two = create(:author)

      authors = [author_one, author_two]

      get :new
      expect(assigns(:authors)).to match_array(authors)
    end

    it 'load all categories' do
      category_one = create(:category)
      category_two = create(:category)

      categories = [category_one, category_two]

      get :new
      expect(assigns(:categories)).to match_array(categories)
    end
  end

  describe 'POST #create' do
    context 'when new post is create successfully redirect to index' do
      let(:author) { build(:author) }
      let(:category) { build(:category) }

      it do
        post :create, post: { title: 'Random', description: 'HAHA HUE BR', author_id: author.id, category_id: category.id }

        expect(response).to redirect_to(posts_path)
      end
    end

    context 'when new post invalid render new action' do
      let(:author) { build(:author) }
      let(:category) { build(:category) }

      it do
        post :create, post: { title: nil, description: 'HAHA HUE BR', author_id: author.id, category_id: category.id }

        expect(response).to render_template('new')
      end
    end
  end

end
