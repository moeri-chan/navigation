require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "display some posts" do
      @post = Post.create :title => 'First Post', :content => 'first content'
      visit posts_path
      page.should have_content 'First Post' 
    end
    
    it "create a new post" do
      visit posts_path
      fill_in 'post_title', :with => 'Second Post'
      fill_in 'post_content', :with => 'second content'
      click_button 'Add Post'
      
      current_path.should == posts_path
      page.should have_content 'Second Post'

      save_and_open_page
    end
  end
end
