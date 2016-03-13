require 'spec_helper'

describe "links api tests", :type => :controller do
  before do
    @link = Link.create(:title => 'First Link', :url => "First_url")
  end
  describe "GET json /links" do
    it "should show a json object" do
      header "Content-Type", "application/json"
      header "Accept", "application/json"
      request "/links"
      expect(last_request.env["CONTENT_TYPE"]).to eq("application/json")
      expect(last_response.body).to include(@link.title)
    end
  end
end
