require 'spec_helper'

describe "Users" do
  before do
    @user = User.create :name => 'first_user', :password => 'pass', :password_confirmation => 'pass'
  end
  describe "GET /users" do
    it "should display user list" do
      visit users_path
      page.should have_content 'first_user' 
    end
    it "should create a new user" do
      visit new_user_path
      fill_in 'user_name', :with => 'second_user'
      fill_in 'user_password', :with => 'pass'
      fill_in 'user_password_confirmation', :with => 'pass'
      click_button 'Create User'

      current_path.should == new_user_path

      visit users_path
      page.should have_content 'second_user'
    end
  end
  describe "PUT /users" do
    it "should edit a user" do
      visit users_path
      click_link 'edit_user1'
      fill_in 'user_name', :with => 'edited_user'
      click_button 'Edit User'

      current_path.should == users_path

      page.should have_content 'edited_user'
    end
  end
end
