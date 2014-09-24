class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      render :index
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :author_id, :category_id)
  end

end