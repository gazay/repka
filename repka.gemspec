# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "repka/version"

Gem::Specification.new do |s|
  s.name        = "repka"
  s.version     = Repka::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['gazay']
  s.email       = ['alex.gaziev@gmail.com']
  s.homepage    = ""
  s.summary     = %q{Repka will help you easily gather stats from controllers, if you use mongoid}
  s.description = %q{Every day you can gathering smart stats with this tool}

  s.rubyforge_project = "repka"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
