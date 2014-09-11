require 'spec_helper'

describe 'cancun spec' do
  include Cancun::Test

  before{ init_cancun_test }

  it 'should let you type args' do
    execute do
      Foo.new.salute
    end.and_type 'bonzo'
    expect(output).to include('Hi bonzo')
  end

  it 'should let you execute without typing' do
    execute! do
      Foo.new.salute
    end
    expect(output).to include('what is your name?')
  end
end


