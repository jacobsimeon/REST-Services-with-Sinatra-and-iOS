# -*- encoding: utf-8 -*-
require File.expand_path('../lib/todos/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jacob Morris"]
  gem.email         = ["jacob.s.morris@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "todos"
  gem.require_paths = ["lib"]
  gem.version       = Todos::VERSION

  gem.add_dependency 'sinatra'
end
