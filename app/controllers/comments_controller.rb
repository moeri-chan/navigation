class CommentsController < ApplicationController
  def index
    @post = Post.find post_id
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    post = Post.find post_id
    post.comments.create(comment)
    redirect_to :back
  end

  def edit
    @comment = Comment.find comment_id
  end

  def update
    prev_comment = Comment.find comment_id
    @post = prev_comment.post
    if prev_comment.update_attributes comment
      redirect_to post_comments_path(@post), :notice => 'Your comment has successfully been updated'
    else
      redirect_to :back, :notice => 'There was an error updating your comment.'
    end
  end
  
  def destroy
    Comment.destroy comment_id
    redirect_to :back, :notice => 'Comment has been deleted.' 
  end

  def post_id
    params.require(:post_id)
  end
  def comment
    params.require(:comment).permit(:title, :content, :post_id)
  end
  def comment_id
    params.require(:id)
  end
end
