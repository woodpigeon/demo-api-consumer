## Demo Api Consumer

This is a simple Rails app demonstrating the use of a GDS-style api-adapter gem 
called [demo-api-adapters](https://github.com/woodpigeon/demo-api-adapters) which
provides access to a demo api ([demo-api](https://github.com/woodpigeon/demo-api)).
The demo api allows fetching, creating and updating of an example Team model.

The demo-api-adapters gem is pulled into the demo-api-consumer ap using a 
relative path.

### Running the app

```
$ mkdir api
$ cd api
$ git clone https://github.com/woodpigeon/demo-api.git
$ git clone https://github.com/woodpigeon/demo-api-adapters.git
$ git clone https://github.com/woodpigeon/demo-api-consumer.git
```

Now start two terminal sessions.

#### Terminal 1

```
$ cd demo-api
$ bundle
$ rake db:create
$ rake db:seed
$ rake db:test:prepare
$ rails s -p 3001
```

#### Terminal 2

```
$ cd demo-api-consumer
$ bundle
$ rails s -p 3000
```

To test the api make sure that
[http://localhost:3001/v1/teams.json](http://localhost:3001/v1/teams.json) returns some 
json.

To run the web app (the `consumer`) go to [http://localhost:3001](http://localhost:3001).

Teams are under an ```admin``` namespace in order to add a bit more excitement.
You should be able to edit a team and create teams.

Validations are a work in progress, and exist in Form Objects in the consumer, and 
models in the api.

### Running tests

In any project directory, ```$ rake``` or ```$ bundle exec rspec```.


## Notes on creating a consumer

### Making your rails app (and test) work without ActiveRecord

In ```application.rb``` remove ```require 'rails/all'``` and replace with 

```
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_model/railtie"
```

Remove ```config/database.yml```.

If using Rspec, in spec/spec_helper, comment out the line 

```
# config.use_transactional_fixtures = true
```

#### Testing

TODO: Notes on using helpers that shio with the adapter
