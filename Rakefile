$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'rspec'
require 'rspec/core/rake_task'
require 'tweets/version'

# configuration options
build_dir = "build"

# rake helpers
def section name
  name = name.to_s # force it to a string
  puts ""
  puts name
  puts "".ljust(name.length, "=")
end

# task definitions
desc "RSpec tests"
RSpec::Core::RakeTask.new do
  #section "Performing test run"
end

desc "Package up the project into a Gem"
task :package => :clean do
  section "Building the latest gem package"
  mkdir build_dir unless Dir.exist? build_dir
  cd build_dir
  system("gem build ../tweets.gemspec")
  cd '../'
end

desc "Clean up"
task :clean do
  section "Getting out the mop (to clean up!)"
  rm_rf build_dir if Dir.exists? build_dir
end

desc "Version"
task :version do
  puts "Latest tweets gem version is #{Tweets.version}"
end

# incomplete tasks
task :push
task :deploy

# default task
task :default => [:clean, :spec, :package, :push, :deploy]