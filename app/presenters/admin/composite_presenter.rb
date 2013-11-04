
# Test presenter with a nested form object
# the ideas is we use the presenter info 
class Admin::CompositePresenter

  attr_reader :name, :team_form

  def initialize(name, team_form)
    @name = name
    @team_form = team_form
  end

  def silly_name
    "Yay, #{name}!"
  end

end