# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cancun/version'

Gem::Specification.new do |spec|
  spec.name          = "cancun"
  spec.version       = Cancun::VERSION
  spec.authors       = ["bonzofenix"]
  spec.email         = ["bonzofenix@gmail.com"]
  spec.description   = %q{Provides helpers to test via Rspec or any other test framework by stubing highline or in integration tests directly by handling STDIN AND STDOUT}
  spec.summary       = %q{this gem should provide a simple DSL solution for unit and integration tests of Command Line apps}
  spec.homepage      = 'https://github.com/bonzofenix/cancun'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sourcify"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency 'highline'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'highline-color'
  spec.add_development_dependency "rake"
end
