require 'bundler/setup'
Bundler.require

class App < Sinatra::Application
  use Urns::App
end
