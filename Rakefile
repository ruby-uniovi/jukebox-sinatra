require_relative 'lib/config'

require 'rspec/core'
require 'rspec/core/rake_task'

task :default => ["spec:all"]

namespace :spec do

  desc "Runs all specs in spec directory"
  task :all do
    RSpec::Core::RakeTask.new(:spec)
    Rake::Task["spec"].execute
  end

end

namespace :db do

  desc "Purges the database"
  task :purge do
    Mongoid.purge!
  end

end
