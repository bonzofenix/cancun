require 'spec_helper'

describe 'excutable spec' do
  include Cancun::Executable

  pending 'works for executables' do
    init_cancun
    type 'Bonzo'
    run './spec/dummy/bin/foo'
      output.should include('Hi Bonzo')
  end
end

