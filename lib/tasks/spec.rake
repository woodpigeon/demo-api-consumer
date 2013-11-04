require 'rake/testtask'

# Just running '$ rake' will run the test suite.
# This is just a convention some developers might expect if its unclear *how*
# to run the tests
task :default => 'spec' 