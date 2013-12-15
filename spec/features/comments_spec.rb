require 'spec_helper'

describe "Comments" do
  before do
    @parent = Post.create :title => 'Parent Post', :content => 'Parent Content'

    @comment = Comment.create :title => 'First Comment', :content => 'first content', :parent => @parent
  end
  describe "GET /comments" do
    it "display some comments" 
      visit posts_path
#      page.should have_content 'Parent Post' 
#      pending("more")
#    end
    
    it "create a new comment"
#      visit posts_path
#      fill_in 'post_title', :with => 'Second Post'
#      fill_in 'post_content', :with => 'second content'
#      click_button 'Create Post'
      
#      current_path.should == posts_path
#      page.should have_content 'Second Post'

#    end
  end
  describe "PUT /comments" do
    it "edits a comment" 
#      visit posts_path
#      click_link 'Edit'

#      current_path.should == edit_post_path(@post)
      
#      find_field('post_title').value.should == 'First Post'
#      fill_in 'post_title', :with => 'Updated Post'
#      click_button 'Update Post'
      
#      current_path.should == posts_path

#      page.should have_content 'Updated Post'
#    end
    
    it "should not update an empty comment"
#      visit posts_path
#      click_link 'Edit'
      
#      fill_in 'post_title', :with => ''
#      click_button 'Update Post'
      
#      current_path.should == edit_post_path(@post)
#      page.should have_content 'There was an error updating your post.'
#    end
  end

  describe "DELETE /comment" do
    it "should delete a comment"
#      visit posts_path
#      find("#post_#{@post.id}").click_link 'Delete'
#      page.should have_content 'Post has been deleted'
#      page.should have_no_content 'First Post'
      
#    end
  end
end
