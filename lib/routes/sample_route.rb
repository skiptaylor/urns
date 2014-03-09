require 'sinatra/base'

module Urns
  module Routes
    def self.registered(app)

      app.get '/sample/?' do
        sample_helper()
        Urn.display_name()
        erb :sample
      end

    end
  end
end
