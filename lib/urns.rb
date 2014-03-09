require 'sinatra/base'

Dotenv.load

module Urns
  module App
    def self.registered(app)
      app.configure do
        app.enable :sessions

        app.set :database,       ENV.fetch('DATABASE_URL')
        app.set :session_secret, ENV.fetch('SESSION_SECRET')
        app.set :views,          ['./views', "#{File.dirname(__FILE__)}/views"]
      end

      require_rel 'models', 'helpers', 'routes'

      app.helpers  Urns::Helpers
      app.register Urns::Routes
    end
  end
end
