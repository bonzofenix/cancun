require 'timeout'
require 'sourcify'
require 'highline'

class Cancun
  module Highline
    attr_reader :exit_code, :output_read
    attr_accessor :input_write

    def init_cancun_highline
      @input_read, @input_write = IO.pipe
      @output_read, @output_write = IO.pipe
      @high_line = HighLine.new(@input_read, @output_write)

      HighLine.stub(:new).and_return(@high_line)
    end

    def high_line
    end

    def execute(&cmd)
      TestCase.new(self).execute(&cmd)
    end

    def output
      TestCase.new(self).output
    end


    class TestCase
      def initialize(model)
        @model = model
      end

      def execute(&block)
        @block = block
        self
      end

      def output
        @output ||= ''
        @output << @model.output_read.dup.read_nonblock(4096) rescue Errno::EAGAIN
        @output
      end

      def and_type(*args)
        run
        @model.input_write << [*args].flatten.join("\n") + "\n"
        sleep 0.01
      end

      def run
        Thread.new do
          Thread.abort_on_exception = true
          begin
            if Cancun.timeout?
              Timeout.timeout(0.3){ @exit_code = @block.call }
            else
              @exit_code = @block.call
            end
          rescue ::Timeout::Error
            warn 'WARNING: cancun timeout, you can set Cancun::Highline.no_timeout!'
          end
        end
      end
    end
  end
end
