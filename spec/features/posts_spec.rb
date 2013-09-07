require 'spec_helper'

describe "Posts" do
  before do
    @post = Post.create :title => 'First Post', :content => 'first content'
  end
  describe "GET /posts" do
    it "display some posts" do
      visit posts_path
      page.should have_content 'First Post' 
    end
    
    it "create a new post" do
      visit posts_path
      fill_in 'post_title', :with => 'Second Post'
      fill_in 'post_content', :with => 'second content'
      click_button 'Create Post'
      
      current_path.should == posts_path
      page.should have_content 'Second Post'

    end
  end
  describe "PUT /posts" do
    it "edits a post" do
      visit posts_path
      click_link 'Edit'

      current_path.should == edit_post_path(@post)
      
      find_field('post_title').value.should == 'First Post'
      fill_in 'post_title', :with => 'Updated Post'
      click_button 'Update Post'
      
      current_path.should == posts_path

      page.should have_content 'Updated Post'
    end
    
    it "should not update an empty post" do
      visit posts_path
      click_link 'Edit'
      
      fill_in 'post_title', :with => ''
      click_button 'Update Post'
      
      current_path.should == edit_post_path(@post)
      page.should have_content 'There was an error updating your post.'
    end
  end

  describe "DELETE /posts" do
    it "should delete a post" do
      visit posts_path
      find("#post_#{@post.id}").click_link 'Delete'
      page.should have_content 'Post has been deleted'
      page.should have_no_content 'First Post'
      
    end
  end
end
