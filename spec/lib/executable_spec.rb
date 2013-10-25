require 'spec_helper'

describe 'excutable spec' do
  include Cancun::Executable

  it 'works for highline' do
    run '../dummy/bin/foo' do
      type 'bonzo'
    end

  end
end

