class PostsController < ApplicationController
  before_action :load_resources, only: [:index, :new]

  def index
    blogi_search = BlogiSearch.new(params[:search_term])
    @posts  = blogi_search.search.only(:id).load(posts: { scope: Post.all })
    @facets = blogi_search.facets
    respond_with @posts, @facets
  end

  def by_category
    blogi_search = BlogiSearch.new(params[:search_term])
    @posts  = blogi_search.filter.only(:id).load(posts: { scope: Post.all })
  end

  def show
    @post = Post.joins(:category, :author).find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def load_resources
    @authors = Author.all
    @categories = Category.all
  end

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :category_id)
  end

end
