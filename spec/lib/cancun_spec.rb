require 'spec_helper'

describe 'cancun spec' do
  include Cancun::Test
  before{ init_cancun_test }

  it 'works for highline' do
    execute do
      Foo.new.salute
    end.and_type 'bonzo'
    expect(output).to include('Hi bonzo')
  end
end

