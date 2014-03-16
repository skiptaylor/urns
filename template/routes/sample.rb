class Routes < Urns::Base

  get '/sample/?' do
    sample_helper()
    'sample from app.'
  end

end
