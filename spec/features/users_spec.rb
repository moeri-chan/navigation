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
  end
end
