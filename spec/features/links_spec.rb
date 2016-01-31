require 'spec_helper'

describe "Links" do
  before do
      @link = Link.create :title => 'First Link', :url => links_path
  end
  describe "GET /links" do
    it "display some links" do
      visit links_path
      expect(page).to have_content 'First Link'
    end
    it "should add a link" do
      visit links_path
      fill_in 'link_title', :with => 'Second Link'
      fill_in 'link_url', :with => 'testing.org'
      click_button 'Create Link'

      current_path == links_path
      expect(page).to have_content 'Second Link'
    end
  end
end
