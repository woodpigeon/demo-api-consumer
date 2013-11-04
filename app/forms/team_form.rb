# A Form object
# see e.g. railscast here http://railscasts.com/episodes/416-form-objects

class TeamForm

  # In Rails 4 we can include ActiveModel::Model and it makes our 
  # Plain Old Ruby Objects (POROs) feel a bit like an ActiveRecord object
  # In Rails 3 you have to include other modules - see links top of file
  # You also have to do the work of assigning the attributes to your instance 
  # variables, and add an attributes method. 
  # Basically, life is easier in Rails 4.

  include ActiveModel::Model 

  # Create getters/setters for anything about a team that can change in the form.
  attr_accessor :id, :name, :email

  validates_presence_of :name
  
  # Team is an openstruct when it reaches us from the api (converted from
  # a hash in xxx-api-adapters) - marshal_dump converts it back to a hash here
  # - but maybe we should have kept it as a hash and just called to_ostruct on 
  # it when using it in a presenter for the convenience of the dot notation?
  def self.from_ostruct(team)
    TeamForm.new(team.marshal_dump)
  end

  def initialize(attributes = {})
    # When we call call 'super' we are calling the current method, with arguments, 
    # on the superclass in this case ActiveModel::Model since we mixed it into 
    # as we have mixed in using 'include ActiveModel::Model' and i thas inserted itself
    # above us in the class hierachy (try printing TeamForm.ancestors in irb)
    # super.initialize will also set up a read-only 'attributes' attribute
    super 
  end

  # We need this so we can tell the url helpers what model name (and hence route)
  # to use when when building paths eg [:admin, @team_form]
  def self.model_name
    ActiveModel::Name.new(self, nil, "Team")
  end

  # If this is true, the model instance can be passed to a url helper or route
  # and it will resolve the the correct url e.g. if id == 1 then admin/teams/1
  # otherwise it will go to admin/teams if persisted? == false
  def persisted?
    true
  end

  # Required to tell url helpers what attribute to use as the id in urls
  # e.g. when the we say redirect_to [:admin, @teamform] it will know to use
  # @teamform.id as the id in the url
  def to_param
    id
  end

  # Saving the form pushed down to here from the controller
  def save(api)
    result = api.update_team(id, self)
    # update errors
  end

end
