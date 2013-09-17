require 'spec_helper'

describe "Posts" do
  before do
    @user = User.create :name => 'first_user', :password => 'first_password', :password_confirmation => 'first_password'
  end
  describe "GET /sessions" do
    it "create a new session" do
      visit log_in_path
      fill_in 'user_name', :with => 'first_user'
      fill_in 'user_password', :with => 'first_password'
      click_button 'Log In'
      
      current_path.should == log_in_path
      page.should have_content 'signed in'

    end
  end
=begin

  describe "DELETE /posts" do
    it "should delete a session" do
      visit posts_path
      find("#post_#{@post.id}").click_link 'Delete'
      page.should have_content 'Post has been deleted'
      page.should have_no_content 'First Post'
      
    end
  end
=end
end
