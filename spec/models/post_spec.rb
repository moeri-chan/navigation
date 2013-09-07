require 'spec_helper'

describe Post do
  it "should allow valid posts" do
    post = Post.new(:title => 'First title', :content => 'first content')
    post.should be_valid
  end
  it "should not allow invalid posts" do
    post = Post.new(:title => '', :content => 'first content')
    post.should_not be_valid
  end
end
