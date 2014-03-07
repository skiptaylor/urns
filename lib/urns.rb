require 'sinatra/base'

module Urns
  class Routes < Sinatra::Application

    # Uncomment to use app views.
    # set :views, './views'

    get '/sample/?' do
      erb :sample
    end

  end
end
