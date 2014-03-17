module Urns
  class Routes < Urns::Base

    get '/sample/?' do
      sample_helper()
      erb :sample
    end
    
    get '/contact-us/?' do
      sample_helper()
      erb :"contact-us"
    end
    
    get '/terms/?' do
      sample_helper()
      erb :terms
    end

  end
end
