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

  gem.add_runtime_dependency 'carrierwave',         '~> 0.10', '>= 0.10.0'
  gem.add_runtime_dependency 'carrierwave-sequel',  '~> 0.1',  '>= 0.1.0'
  gem.add_runtime_dependency 'chronic',             '~> 0.10', '>= 0.10.2'
  gem.add_runtime_dependency 'dotenv',              '~> 0.10', '>= 0.10.0'
  gem.add_runtime_dependency 'fog',                 '~> 1.21', '>= 1.21.0'
  gem.add_runtime_dependency 'foreman',             '~> 0.63', '>= 0.63.0'
  gem.add_runtime_dependency 'rack',                '~> 1.5',  '>= 1.5.2'
  gem.add_runtime_dependency 'pg',                  '~> 0.17', '>= 0.17.1'
  gem.add_runtime_dependency 'puma',                '~> 2.7',  '>= 2.7.1'
  gem.add_runtime_dependency 'rake',                '~> 10.1', '>= 10.1.1'
  gem.add_runtime_dependency 'require_all',         '~> 1.3',  '>= 1.3.2'
  gem.add_runtime_dependency 'sass',                '~> 3.3',  '>= 3.3.0'
  gem.add_runtime_dependency 'sequel',              '~> 4.7',  '>= 4.7.0'
  gem.add_runtime_dependency 'sinatra',             '~> 1.4',  '>= 1.4.4'
  gem.add_runtime_dependency 'sinatra-contrib',     '~> 1.4',  '>= 1.4.2'
  gem.add_runtime_dependency 'sinatra-sequel',      '~> 0.9',  '>= 0.9.0'
  gem.add_runtime_dependency 'thor',                '~> 0.18', '>= 0.18.1'
  gem.add_runtime_dependency 'uglifier',            '~> 2.4',  '>= 2.4.0'
end
