require 'open3'
module Cancun
  module Executable
    def run(executable)
      @w = nil
      IO.popen(executable, 'w') do |w|
        @w = w
        yield if block_given?
      end
    end

    def type(*stream)
      @w.puts stream
      @w.flush
    end
  end
end
