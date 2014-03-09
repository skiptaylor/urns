require 'bundler/setup'
Bundler.require

require_rel 'routes'

class App < Sinatra::Application
  use Router
  register Urns::App
end
