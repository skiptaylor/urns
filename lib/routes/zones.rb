class Routes < Urns::Base

  get "/shipping/zones/new/?" do
    auth_admin
    @zone = Zone.new
    erb :"/shipping/zones/zones_edit"
  end

  post "/shipping/zones/new/?" do
    auth_admin
    zone = Zone.create(
      :name   => params[:name],
    )

    redirect "/shipping/zones/zones"
  end
  
  get "/shipping/zones/zones/?" do
    auth_admin
    @zone = Zone
    erb :"/shipping/zones/zones"
  end

  get "/shipping/zones/:id/edit/?" do
    auth_admin
    @zone = Zone[params[:id]]
    erb :"/shipping/zones/zones_edit"
  end

  post "/shipping/zones/:id/edit/?" do
    auth_admin
    zone = Zone[params[:id]]
    zone.update(
      :name   => params[:name]
    )

    redirect "/shipping/zones/zones"
  end

  get "/shipping/zones/:id/delete/?" do
    auth_admin
    zone = Zone[params[:id]]
    zone.destroy
    redirect "/shipping/zones/zones"
  end

end