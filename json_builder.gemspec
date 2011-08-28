# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "json_builder/version"

Gem::Specification.new do |s|
  s.name        = "json_builder"
  s.version     = JSONBuilder::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Garrett Bjerkhoel"]
  s.email       = ["me@garrettbjerkhoel.com"]
  s.homepage    = "http://github.com/dewski/json_builder"
  s.summary     = "Ruby DSL for building JSON."
  s.description = "JSON Builder."

  s.required_rubygems_version = ">= 1.3.6"
  
  s.add_dependency "activesupport", ">= 3.0.0"
  s.add_dependency "actionpack", ">= 3.0.0"
  
  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = Dir.glob("lib/**/*") + %w(README.md MIT-LICENSE)
  s.require_path = 'lib'
end
