require 'spec_helper'

describe 'highline spec' do
  include Cancun::Highline

  before do
    init_cancun_highline
  end

  it 'works for highline' do
    execute do
      Foo.new.salute
    end.and_type 'bonzo'
    expect(output).to include('Hi bonzo')
  end
end

