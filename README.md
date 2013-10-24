# Cancun

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
      run described_class.new.salute do
        type 'bonzo'
        output.should be('Hi bonzo')
      end
    end
  end
```

###testing executable with Rspec:

For testing this ./executable:

```bash
#!/usr/bin/env ruby

puts 'who are you?'
name = gets
puts "Hi #{name}"
```

You would use this code:

```ruby
require 'spec_helper'

describe 'executable' do
  include Cancun::Executable
  
  it 'test executable' do
    run './executable' do
      type 'bonzo'
      output.should be('Hi bonzo')
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
