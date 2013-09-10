require 'spec_helper'

describe "Users" do
  before do
    @user = User.create :name => 'first_user', :password => 'pass', :password_confirmation => 'pass'
  end
  describe "GET /users" do
    it "display user list" do
      visit users_path
      page.should have_content 'first_user' 
    end
    it "create a new user" do
      visit new_user_path
      fill_in 'user_name', :with => 'second_user'
      fill_in 'password', :with => 'pass'
      fill_in 'password_confirmation', :with => 'pass'
      click_button 'Create User'

      current_path.should == users_path
      page.should have_content 'second_user'
    end
  end
end
