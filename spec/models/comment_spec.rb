require 'spec_helper'

describe Comment do
  before do
    @parent_post = mock_model(Post)
    @comment = Comment.new(:title => 'First title', :content => 'first content', :post => @parent_post)
  end
  it "should allow valid comments" do
    @comment.should be_valid
  end
  it "should require a title" do
    invalid_comment = Comment.new(:title => '', :content => 'first content')
    invalid_comment.should_not be_valid
  end
  it "should belong to a post" do
    parent = @comment.post
    expect(parent).to eq(@parent_post)
  end
end
