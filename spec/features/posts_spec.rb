require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "display some posts" do
      @post = Post.create :title => 'First Post', :content => 'first content'
      visit posts_path
      page.should have_content 'First Post' 
    end
  end
end
