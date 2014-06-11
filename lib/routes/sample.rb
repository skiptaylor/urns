
  class Routes < Urns::Base

    get '/sample/?' do
      erb :sample
    end
    
    get '/contact-us/?' do
      erb :"contact-us"
    end
    
    get '/terms/?' do
      erb :terms
    end

  end

