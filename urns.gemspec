# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.platform = Gem::Platform::RUBY

  gem.name        = 'urns'
  gem.version     = '5.1'
  gem.author      = ['skip taylor']
  gem.email       = ['skiptaylor101@gmail.com']
  gem.homepage    = "https://github.com/skiptaylor/urns.git"
  gem.license     = 'MIT'
  gem.summary     = 'urns5!'
  gem.description = 'Contains all the urns pages'

  gem.files         = Dir['**/{*,.gitignore,.env}'] 
  gem.bindir        = 'bin'
  gem.executables   = 'urns'
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'carrierwave-aws',     '~> 1.5'
  gem.add_runtime_dependency 'carrierwave-sequel',  '~> 0.1.0'
  gem.add_runtime_dependency 'chronic',             '~> 0.10', '>= 0.10.2'
  gem.add_runtime_dependency 'dotenv',              '~> 2.8', '>= 2.8.1'
  gem.add_runtime_dependency 'fog',                 '~> 1.37.0'
  gem.add_runtime_dependency 'foreman',             '~> 0.87.2'
  gem.add_runtime_dependency 'rack',                '~> 2.2', '>= 2.2.4'
  gem.add_runtime_dependency 'pg',                  '~> 1.4', '>= 1.4.6'
  gem.add_runtime_dependency 'puma',                '~> 6.2', '>= 6.2.2'
  gem.add_runtime_dependency 'rake',                '~> 13.0','>= 13.0.6'
  gem.add_runtime_dependency 'require_all',         '~> 1.3', '>= 1.3.2'
  gem.add_runtime_dependency 'sass',                '~> 3.3', '>= 3.3.0'
  gem.add_runtime_dependency 'sequel',              '~> 5.67'
  gem.add_runtime_dependency 'sinatra',             '~> 3.0', '>= 3.0.5'
  gem.add_runtime_dependency 'sinatra-contrib',     '~> 3.0', '>= 3.0.5'
  gem.add_runtime_dependency 'sinatra-sequel',      '~> 0.9.0'
  gem.add_runtime_dependency 'sinatra-chassis',     '>= 1.1.1'
  gem.add_runtime_dependency 'thor',                '~> 1.2', '>= 1.2.1'
  gem.add_runtime_dependency 'uglifier',            '~> 2.4', '>= 2.4.0'
end
