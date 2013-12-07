# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nagios_blade/version'

Gem::Specification.new do |spec|
  spec.name          = "nagios_blade"
  spec.version       = NagiosBlade::VERSION
  spec.authors       = ["Aleksei Gusev"]
  spec.email         = ["aleksei.gusev@gmail.com"]
  spec.description   = %q{Nagios plugin to monitor ASICMiner Blade.}
  spec.summary       = %q{Nagios plugin to monitor ASICMiner Blade.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"

  spec.add_dependency "nagios-plugin"
end
