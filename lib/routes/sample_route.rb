module Urns
  module Router
    def self.registered(app)

      app.get '/sample/?' do
        sample_helper()
        Urn.display_name()
        erb :sample
      end

    end
  end
end
