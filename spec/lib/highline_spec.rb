require 'spec_helper'

describe 'highline spec' do
  include Cancun::Highline

  before do
    init_cancun_highline
  end

  it 'works for highline' do
      type 'bonzo'
      run_sync {Foo.new.salute}
      output.should include('Hi Bonzo')
  end
end

