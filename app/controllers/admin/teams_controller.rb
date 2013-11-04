
# Use Presenter objects for index/show, FormObjects for edit/new
# (what to do if you want to present some info and stil have a form for other info?
# - add a formobject to a presenter (a good rule is to only pass one object to a view))
# Useful references:
# * http://pivotallabs.com/form-backing-objects-for-fun-and-profit/

class Admin::TeamsController < Admin::BaseController
  respond_to :html

  def show
    team = api.team(params[:id])
    @presenter = Admin::TeamPresenter.new(team)
    respond_with @presenter
  end

  def index
    result = api.teams(params)
    @presenter = Admin::TeamsPresenter.new(result)
    respond_with @presenter
  end

  def edit
    # team at this point is an OpenStruct but we could return it from the api-adpaters
    # gem as a hash and do to_ostruct on it if needed.
    team = api.team(params[:id])

    # create a new TeamForm object - as we don't have an AR model to back the form
    # this is used in place.
    @team_form = TeamForm.from_ostruct(team)   

  end

  def update
    
    @team_form = TeamForm.new(params[:team])

    # pass 1 (FormObject) and pass 2 (API) validations
    flash[:notice] = "Saved" if @team_form.valid? && @team_form.save(api)
    # if 
    #   redirect_to admin_team_path(@team_form)
    # else 
    p url_for([:admin, @team_form])
      respond_with(:admin, @team_form)
    #end
    
  end

end
