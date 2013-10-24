# Cancun

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'cancun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cancun

## Usage

### Testing highline with Rspec

Require cancun on your gemspec by adding this line on your spec_helper.rb

```ruby
require 'cancun'
```

on your spec cancun works the following way:

```ruby
require 'spec_helper'

class Foo
  def salute
      h = HighLine.new
      h.ask 'what is your name?'
      h.say "Hi #{name}
    end
  end
end

describe Foo do
  include Cancun::Highline
  before { init_highline_test }
 
  describe '#hello' do
    it 'says hello correctly' do
      run described_class.new.salute do
        type 'bonzo'
        output.should be('Hi bonzo')
      end
    end
  end
end
```

#testing executable with Rspec

TODO

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
