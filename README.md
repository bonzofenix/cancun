# Cancun
[![Build Status](https://travis-ci.org/bonzofenix/cancun.png)](https://travis-ci.org/bonzofenix/cancun)

DSL for testing command line applications in ruby

## Installation

Add this line to your application's Gemfile:

    gem 'cancun'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cancun

## Usage

Require cancun on your spec_helper.rb when using *Rspec*:
```ruby
require 'cancun'
```


### Testing highline with Rspec:

For testing this ruby class:
```ruby
class Foo
  def salute
      h = HighLine.new
      h.ask 'what is your name?'
      h.say "Hi #{name}"
    end
  end
end
```
cancun would work the following way:

```ruby
require 'spec_helper'

describe Foo do
  include Cancun::Highline
  before { init_highline_test }
 
  describe '#hello' do
    it 'says hello correctly' do
    execute do
      Foo.new.salute
    end.and_type 'bonzo'
    expect(output).to include('Hi bonzo')
  end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
