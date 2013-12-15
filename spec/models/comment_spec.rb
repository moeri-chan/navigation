require 'spec_helper'

describe Comment do
  it "should allow valid comments" do
    comment = Comment.new(:title => 'First title', :content => 'first content')
    comment.should be_valid
  end
  it "should require a title" do
    comment = Comment.new(:title => '', :content => 'first content')
    comment.should_not be_valid
  end
end
