# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.platform = Gem::Platform::RUBY

  gem.name        = 'urns'
  gem.version     = '1.0.0'
  gem.author      = ''
  gem.email       = ''
  gem.homepage    = ''
  gem.license     = ''
  gem.summary     = ''
  gem.description = ''

  gem.files         = Dir['**/{*,.gitignore,.env}']
  gem.bindir        = 'bin'
  gem.executables   = 'urns'
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'sinatra',         '~> 1.4',  '>= 1.4.4'
  gem.add_runtime_dependency 'sinatra-contrib', '~> 1.4',  '>= 1.4.2'
  gem.add_runtime_dependency 'thor',            '~> 0.18', '>= 0.18.1'

  gem.add_development_dependency 'rake', '~> 10.1', '>= 10.1.1'
end
