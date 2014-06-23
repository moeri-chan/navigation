require 'spec_helper'

describe "Comments" do
  before do
    @parent = Post.create :title => 'Parent Post', :content => 'Parent Content'

    @comment = Comment.create :title => 'First Comment', :content => 'first content', :post => @parent
  end
  describe "GET /posts/1/comments" do
    it "should display some comments" do
      visit post_comments_path(@parent)
      page.should have_content 'First Comment' 
    end
    
    it "create a new comment" do
      visit post_comments_path(@parent)
      fill_in 'comment_title', :with => 'Second Comment'
      fill_in 'comment_content', :with => 'second comment content'
      click_button 'Create Comment'
      
      current_path.should == post_comments_path(@parent)
      page.should have_content 'Second Comment'

    end
  end
  describe "PUT /comments" do
    it "edits a comment" do
      visit edit_comment_path(@comment)
      
      find_field('comment_title').value.should == 'First Comment'
      fill_in 'comment_title', :with => 'Updated Comment'
      click_button 'Update Comment'
      
      current_path.should == post_comments_path(@parent)

      page.should have_content 'success'
    end
    
    it "should not update an empty comment" do
      visit edit_comment_path(@comment)
      
      fill_in 'comment_title', :with => ''
      click_button 'Update Comment'
      
      current_path.should == edit_comment_path(@comment)
      page.should have_content 'There was an error updating your comment.'
    end
  end

  describe "DELETE /comment" do
    it "should delete a comment" do
      visit post_comments_path(@parent)
      find("#comment_#{@comment.id}").click_link 'Delete'
#      page.should have_content 'Post has been deleted'
#      page.should have_no_content 'First Post'
      
    end
  end
end
