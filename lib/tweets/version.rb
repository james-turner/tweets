module Tweets
  module Version
    MAJOR = 0
    MINOR = 0
    PATCH = 2
    BUILD = ""
    STRING = [MAJOR, MINOR, PATCH, BUILD].select{|version| version.to_s.length > 0}.join('.')
  end

  def self.version
    return Version::STRING
  end
end
