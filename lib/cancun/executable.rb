require 'open3'
module Cancun
  module Executable
    def init_cancun
      @output_read, @output_write = IO.pipe
      @input_read, @input_write = IO.pipe
    end

    def run(executable)
      @w = nil

      IO.popen(executable, out: @output_write, in: @input_read)
    end

    def type(*args)
      @input_write << [*args].flatten.join("\n") + "\n"
      sleep 0.01
    end

    # def type(*stream)

      # @w.puts stream
      # @w.flush
    # end

    def output
      @output ||= ''
      @output << @output_read.dup.read_nonblock(4096) rescue Errno::EAGAIN
      @output
    end
  end
end
