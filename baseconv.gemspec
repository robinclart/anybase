# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'baseconv/version'

Gem::Specification.new do |spec|
  spec.name          = "baseconv"
  spec.version       = Baseconv::VERSION
  spec.authors       = ["Robin Clart"]
  spec.email         = ["robin@omise.co"]

  spec.summary       = %q{Convert a number from any base to any other base.}
  spec.homepage      = "https://github.com/robinclart/baseconv"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
