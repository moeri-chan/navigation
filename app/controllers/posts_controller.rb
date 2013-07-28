class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def create
    Post.create(post_params)
    redirect_to :back
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
