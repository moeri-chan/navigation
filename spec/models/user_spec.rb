require 'spec_helper'
#  before do
#    @user = User.create :name => 'test', :content => 'pass'
#    @no_ps_user = User.create :name => 'bad_pass', :content => ''
#  end
describe User do
  it "should create a new user" do
    user = User.new :name => 'new', :password => 'pass', :password_confirmation => 'pass'
    user.should be_valid
  end
  it "should require a password" do
    user = User.new :name => 'new'
    user.should_not be_valid
  end

end
