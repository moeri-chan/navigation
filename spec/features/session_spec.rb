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
    it "should not create a new session for an incorrect password" do
      visit log_in_path
      fill_in 'user_name', :with => 'first_user'
      fill_in 'user_password', :with => 'incorrect_password'
      click_button 'Log In'
      
      current_path.should == log_in_path
      page.should have_content 'Invalid email or password'

    end
  end

  describe "When logged in" do
    before :each do
      visit log_in_path
      fill_in 'user_name', :with => 'first_user'
      fill_in 'user_password', :with => 'first_password'
      click_button 'Log In'
    end
    it "should delete a session" do

      visit log_in_path
      click_link 'Log Out'
      page.should have_content 'signed out'
      
    end
  end
end
