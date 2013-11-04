class HomeController < ApplicationController

  def index
    redirect_to admin_teams_path
  end
  
end