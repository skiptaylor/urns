require 'sinatra/base'

Dotenv.load

module Urns
  
  class Base < Sinatra::Application
    configure do
    	before do
        unless request.request_method == 'POST'
          unless request.url.include? "https://www." || request.url.include? "aui-admin"
            redirect ENV.fetch('DOMAIN')
          end
        end
      end

    
      use Rack::Protection, :except => :session_hijacking
      enable :sessions
      use Rack::Session::Cookie, :key => 'rack.session',
                                 :secret => 'secret123',
                                 :expire_after => ENV.fetch("EXPIRE").to_i
      set :database,       ENV.fetch('DATABASE_URL')
      set :session_secret, ENV.fetch('SESSION_SECRET')
      set :views,          ['./views', "#{File.dirname(__FILE__)}/views"]
    end

    CarrierWave.configure do |config|
      config.fog_credentials = {
        aws_secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
            aws_access_key_id: ENV.fetch('AWS_ACCESS_KEY_ID'),
                     provider: ENV.fetch('PROVIDER')
      }
      config.fog_directory  = ENV.fetch('FOG_DIRECTORY')
    end

    require_rel 'models', 'helpers', 'settings'
    helpers Urns::Helpers
  end

  class App < Base
    require_rel 'routes'
    use Urns::Routes
  end
end

