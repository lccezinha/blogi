class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @authors = Author.all
    @categories = Category.all
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

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :category_id)
  end

end