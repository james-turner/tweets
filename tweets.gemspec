$:.unshift "#{File.dirname(__FILE__)}/lib"

Gem::Specification.new do |s|
  require 'tweets/version'
  s.name = "tweets"
  s.version = Tweets.version
  s.authors = ["James Turner"]
  s.date = %q{2011-10-13}
  s.description = 'Tweet finder for strings'
  s.summary = s.description
  s.files = Dir["lib/**/*.rb", "spec/**/*.rb", "README.rdoc"].to_a
  s.homepage = 'http://github.com/james-turner/tweets'
  s.has_rdoc = true
  s.rubyforge_project = "tweets"
  # gem dependencies
  # - used to require json, is now built into ruby 1.9.2
  # ruby versions
  s.required_ruby_version = ">= 1.9.2"
end
