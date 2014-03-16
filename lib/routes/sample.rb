module Urns
  class Routes < Urns::Base

    get '/sample/?' do
      sample_helper()
      erb :sample
    end

  end
end
