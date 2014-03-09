require 'sinatra/base'

class Router < Sinatra::Application

  get '/sample/?' do
    'This route overrides the /sample route in the gem.'
  end

end
