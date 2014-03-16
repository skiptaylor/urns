require 'bundler/setup'
Bundler.require

class App < Urns::Base
  require_rel 'routes'

  use Routes
  use Urns::App
end
