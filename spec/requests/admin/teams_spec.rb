require 'spec_helper'

describe "Teams" do

  describe "GET /admin/teams" do

    #before(:each) { login(FactoryGirl.create(:admin_user)) }
    # TODO: stub api calls - use test_helpers that ship with api_adapters?

    it "displays a list of team" do
      
      visit admin_teams_path
      
      page.should have_content("Teams")
      expect(page.current_path).to eq(admin_teams_path)
      #... etc

    end

    it "..." do
        pending "more tests...."
    end

  end
end
