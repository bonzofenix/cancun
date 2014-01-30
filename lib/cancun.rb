require "cancun/version"

class Cancun
  class << self
    def no_timeout!
      @no_timeout = true
    end

    def timeout?
      !@no_timeout
    end
  end
end

require 'cancun/executable'
require 'cancun/highline'
