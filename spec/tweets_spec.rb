$:.unshift "#{File.dirname(__FILE__)}/../lib"
require 'tweets'
require 'tweets/version'
require 'rspec'

describe "tweets" do

  it "should give me a list" do

    "justin bieber".tweets.should be_a_kind_of Array

  end

  it "version should be in a major.minor.patch.build format" do

    Tweets.version.should match /(\d\.){,3}(\w)/

  end

end
