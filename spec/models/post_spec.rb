require 'spec_helper'

describe Post do
  before do
    @valid_post = Post.new(:title => 'First title', :content => 'first content')
    @empty_title_post = Post.new(:title => '', :content => 'first content')
  end
  it "should allow valid posts" do
    @valid_post.should be_valid
  end
  it "should not allow invalid posts" do
    @empty_title_post.should_not be_valid
  end
  it "should have many comments" do
    @valid_post.should have_many(:comments)
  end
end
