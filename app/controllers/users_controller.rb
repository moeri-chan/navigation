class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    User.create user_params
    redirect_to :back
  end
=begin  
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
=end
  def user_params
    params.require(:user).permit(:user, :password, :password_conformation)
  end
=begin
  def id_params
    params.require(:id)
  end
=end
end
