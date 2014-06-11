module Urns
  class Routes < Urns::Base

    get '/contact-us/?' do
      erb :"contact-us"
    end
    
    get '/terms/?' do
      erb :terms
    end

  end
end
