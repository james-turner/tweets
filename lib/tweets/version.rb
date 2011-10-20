module Tweets
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 1
    BUILD = "pre2"
    STRING = [MAJOR, MINOR, PATCH, BUILD].join('.')
  end

  def self.version
    return Version::STRING
  end
end