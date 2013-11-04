
# Always report test coverage when running tests
# simplecov test coverage has to start before any application code has loaded
# (so we can't put it at the top of the test_helper as recommended because when 
# using this default rake task to start tests, as it depends on the db:test:prepare
# task (which loads the rails env) app code has already been loaded.
# https://github.com/colszowka/simplecov
# These lines need to be at the top - see https://github.com/colszowka/simplecov
require 'simplecov'

# Start simplecov with the default set of rails path filters e.g. vendor/bundle
# excluded
SimpleCov.start 'rails'


ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
#require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Use poltergeist driver for js testing, rather then default selenium driver which 
# requires Qt
# You need to install phantomjs also:
# on a mac
# $ brew install phantomjs
# on linux, see instructions here
# https://github.com/jonleighton/poltergeist
Capybara.javascript_driver = :poltergeist


RSpec.configure do |config|

  config.include Capybara::DSL

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

def login(user)
  visit new_user_session_path 
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button 'Sign in'
end

