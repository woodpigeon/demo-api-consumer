

# whats it like using a presenter with a nested formobject?
# ie edit/update through the form, but relying on the presenter for 
# display info
class Admin::CompositesController < Admin::BaseController

  respond_to :html

  def edit
    team = api.team(params[:id])
    team_form = TeamForm.from_ostruct(team)   
    @presenter = Admin::CompositePresenter.new("mucker", team_form)
    respond_with @presenter
  end

  def update
    @team_form = TeamForm.new(params[:team])
    result = @team_form.save(api)
    
    respond_with [:admin, @team_form]
    # redirect_to admin_team_path(@team_form.id)
  end

end
