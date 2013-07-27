require 'spec_helper'

describe "Posts" do
  describe "GET /posts" do
    it "display some tasks" do
      visit tasks_path

    end
  end
end
