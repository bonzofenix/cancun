require 'cancun'

class Foo
  include Cancun::Highline

  def salute
    h = HighLine.new
    name = h.ask 'what is your name?'
    h.say "Hi #{name}"
  end
end
