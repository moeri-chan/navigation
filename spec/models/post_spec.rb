require 'spec_helper'

describe Post do
  before do
    @valid_post = Post.new(:title => 'First title', :content => 'first content')
    @empty_title_post = Post.new(:title => '', :content => 'first content')
    @valid_child = @valid_post.posts.new(:title => 'First child title', :content => 'first child content')
  end
  it "should allow valid posts" do
    expect(@valid_post).to be_valid
  end
  it "should not allow invalid posts" do
    expect(@empty_title_post).not_to be_valid
  end
  it "should have many comments" do
    expect(@valid_post.posts.first).to be(@valid_child)
  end
end
