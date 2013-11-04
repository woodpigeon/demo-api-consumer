source 'https://rubygems.org'

gem 'rails', '4.0.0'
#gem 'figaro'
gem 'kaminari'
gem 'simple_form'
gem "lograge" # tame logging
gem 'flutie' # setting page titles
gem 'jquery-rails'

# Asset stuff, no longer in an :assets group in Rails 4
gem 'coffee-rails'
gem 'uglifier'
gem "therubyracer"
gem "less-rails" 
gem "twitter-bootstrap-rails" # uses Less
gem "sass-rails" # required for css compilation eg of application.css

# reference this gem locally - any changes to the gem code and you must restart 
# rails server
gem 'demo-api-adapters', path: '../demo-api-adapters'

group :development, :test do
  gem 'rspec-rails' 
end

group :development do
  gem 'quiet_assets' # stop noisy asset logging
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails' # irb replacement
end

group :test do
  gem 'database_cleaner'
  gem 'capybara' # for capybara integration and spec matchers
  gem 'simplecov', :require => false
  gem 'factory_girl_rails'
end

