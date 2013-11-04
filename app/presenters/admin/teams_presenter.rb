# Presenter for the wizard - experimental

class Admin::TeamsPresenter

  attr_reader :teams, :current_page, :total, :page_size

  def initialize(result_set)
    
    # convert each team OpenStruct into a TeamPresenter
    team_presenters = result_set.results.map do |team|  
        Admin::TeamPresenter.new(team)
    end

    # Convert our array or TeamPresenters into a 'kaminari array' 
    # and set the pagination parameters on the array to those that 
    # came back from the API, so the kaminari view helper will work nicely.
    # Could move this into a super class or module as we'll me doing the same
    # thing in every collection presenter
    @teams = Kaminari.paginate_array(team_presenters, total_count: result_set.total)
        .page(result_set.current_page)
        .per(result_set.page_size)

  end

end