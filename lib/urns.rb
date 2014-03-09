require 'sinatra/base'

Dotenv.load

module Urns
  class App < Sinatra::Application

    configure do
      enable :sessions

      set :database,       ENV.fetch('DATABASE_URL')
      set :session_secret, ENV.fetch('SESSION_SECRET')
      set :views,          ['./views', "#{File.dirname(__FILE__)}/views"]
    end

    require_rel 'models', 'helpers'

    helpers Urns::Helpers

    get '/sample/?' do
      sample_helper()
      Urn.display_name()
      erb :sample
    end

  end
end
