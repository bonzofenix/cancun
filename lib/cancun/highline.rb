module Cancun
  module Highline
    def init_highline_test
      @input_read, @input_write = IO.pipe
      @output_read, @output_write = IO.pipe
      @exit_code = nil

      high_line = HighLine.new(@input_read, @output_write)
      # HighLine.track_eof = false
      HighLine.stub(:new).and_return(high_line)
    end

    def type(*args)
      @input_write << [*args].flatten.join("\n") + "\n"
      sleep 0.01
    end

    def run
      Thread.new do
        Thread.abort_on_exception = true
        begin
          Timeout.timeout(0.3){ @exit_code = yield }
        rescue Timeout::Error => e

        end
      end
    end

    def run_sync
      run { yield }.join
    end
    attr_reader :exit_code
    def output
      @output ||= ''
      @output << @output_read.dup.read_nonblock(4096) rescue Errno::EAGAIN
      @output
    end

    def last_line
      output.split("\n").last
    end
  end
end
