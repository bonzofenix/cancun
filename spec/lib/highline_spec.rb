require 'spec_helper'

describe 'highline spec' do
  include Cancun::Highline

  before do
    init_cancun_highline
  end

  it 'works for highline' do
      type 'bonzo'
      execute do
        Foo.new.salute
      end.and_type 'bonzo'
      output.should include('Hi bonzo')
  end
end

