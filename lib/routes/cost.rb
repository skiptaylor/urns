module Urns
  module Router
    def self.registered(app)

      app.get '/shipping/cost/new/?' do
        auth_admin
        @cost = Cost.new
        erb :'shipping/cost/cost_edit', layout: :'layout_product'
      end

    end
  end
end
