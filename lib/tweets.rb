require 'open-uri'
require 'json'

module Tweets
  module Extensions
    module String

      # Retrieve the latest tweets defined by the string version of yourself.
      #
      # Example:
      #  >> "justin bieber".tweets
      #  => ["the bieb is amazing!", "moar beeb plox", ...]
      #
      #  >> "@user".tweets
      #  => ["@user you are amazing", ...]
      #
      #  >> "#tag"
      #  => ["#tag is the most cool twitter tag evah ya!", ...]
      #
      #
      # The string can contain the syntax that is allowed in
      # any of the twitter search
      # @see https://dev.twitter.com/docs/using-search
      #
      # Arguments:
      #   language: (String)
      def tweets
        search = URI.escape(self.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))

        begin
          json = JSON.parse open("http://search.twitter.com/search.json?q=#{search}").read.to_s
          json["results"].map { |result| result["text"] } unless json.has_key? "error" || []
        rescue SocketError
          # no socket connection.
          raise SocketError, "Could not connect to the twitter search api. Check your internet connection."
        rescue JSON::ParserError
          # not json?
          raise JSON::ParserError, "The response received from twitter was not JSON. Check your internet connection."
        end
      end
    end
  end
end

# In you go!
#
# Includes the tweets string extension
# inside the String ruby class via mixin
#
String.send :include, Tweets::Extensions::String