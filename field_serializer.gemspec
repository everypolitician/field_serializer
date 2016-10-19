# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'field_serializer/version'

Gem::Specification.new do |spec|
  spec.name          = "field_serializer"
  spec.version       = FieldSerializer::VERSION
  spec.authors       = ["EveryPolitician team"]
  spec.email         = ["team@everypolitician.org"]

  spec.summary       = %q{Define a set of fields and serialize them to a hash.}
  spec.homepage      = "https://github.com/everypolitician/field_serializer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.1'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
