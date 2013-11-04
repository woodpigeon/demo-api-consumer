class Admin::TeamPresenter

  attr_reader :id, :name, :email

  def initialize(team)
    @id, @name, @email = team.id, team.name, team.email
  end

  def speciall_name
    "#{name} sndlsfj"
  end

end