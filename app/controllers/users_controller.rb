class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end
=begin  
  def create
    Post.create post_params
    redirect_to :back
  end

  def edit
    @post = Post.find id_params 
  end

  def update
    post = Post.find id_params
    if post.update_attributes post_params
      redirect_to posts_path, :notice => 'Your task has successfully been updated'
    else
      redirect_to :back, :notice => 'There was an error updating your post.'
    end
  end

  def destroy
    Post.destroy id_params
    redirect_to :back, :notice => 'Post has been deleted.' 
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def id_params
    params.require(:id)
  end
=end
end
