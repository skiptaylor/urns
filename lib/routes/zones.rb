class Routes < Urns::Base

  get "/shipping/zones/new/?" do
    @zone = Zone.new
    erb :"/shipping/zones/zones_edit"
  end

  post "/shipping/zones/new/?" do
    zone = Zone.create(
      :name   => params[:name],
    )

    redirect "/shipping/zones/zones"
  end
  
  get "/shipping/zones/zones/?" do
    @zone = Zone
    erb :"/shipping/zones/zones"
  end

  get "/shipping/zones/:id/edit/?" do
    @zone = Zone[params[:id]]
    erb :"/shipping/zones/zones_edit"
  end

  post "/shipping/zones/:id/edit/?" do
    zone = Zone[params[:id]]
    zone.update(
      :name   => params[:name]
    )

    redirect "/shipping/zones/zones"
  end

  get "/shipping/zones/:id/delete/?" do
    zone = Zone[params[:id]]
    zone.destroy
    redirect "/shipping/zones/zones"
  end

end