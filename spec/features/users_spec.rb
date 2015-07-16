require 'spec_helper'

describe "Users" do
  before do
    @user = User.create :name => 'first_user', :password => 'pass', :password_confirmation => 'pass'
  end
  describe "GET /users" do
    it "should display user list" do
      visit users_path
      expect(page).to have_content 'first_user' 
    end
    it "should create a new user" do
      visit new_user_path
      fill_in 'user_name', :with => 'second_user'
      fill_in 'user_password', :with => 'pass'
      fill_in 'user_password_confirmation', :with => 'pass'
      click_button 'Create User'

      expect(current_path).to eq new_user_path

      visit users_path
      expect(page).to have_content 'second_user'
    end
  end
  describe "PUT /users" do
    it "should edit a user" do
      visit users_path
      click_link 'Edit'
      fill_in 'user_name', :with => 'edited_user'
      click_button 'Update User'

      expect(current_path).to eq users_path

      expect(page).to have_content 'edited_user'
    end
    it "should fail to edit a user" do
      visit users_path
      click_link 'Edit'
      fill_in 'user_name', :with => ''
      click_button 'Update User'

      expect(page).to have_content 'There was an error updating the User.'
    end
  end
  describe "DELETE /user" do
    it "should delete a user" do
      visit users_path
      click_link "Delete"
      expect(page).to_not have_content 'first_user'
    end
  end
end
