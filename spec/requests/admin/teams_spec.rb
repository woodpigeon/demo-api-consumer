require 'spec_helper'

describe "Teams" do

  describe "GET /admin/teams" do

    #before(:each) { login(FactoryGirl.create(:admin_user)) }

    it "displays a list if agreements" do
      
      visit admin_teams_path
      
      page.should have_content("Teams")
      expect(page.current_path).to eq(admin_teams_path)

    end
  end
end
