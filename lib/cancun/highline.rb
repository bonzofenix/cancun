require 'cancun'
require "highline/color"
require 'forwardable'

class Cancun
  module Highline
    extend ::Forwardable
    include ::Highline::Color

    def_delegators :hl, :ask, :say, :menu, :choose, :color, :agree

    def hl
      @hl ||= HighLine.new
    end
  end
end
