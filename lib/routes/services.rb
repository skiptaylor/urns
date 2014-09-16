class Routes < Urns::Base

  get "/shipping/services/new/?" do
    auth_admin
    @service = Service.new
    erb :"/shipping/services/service_edit"
  end

  post "/shipping/services/new/?" do
    auth_admin
    service = Service.create(
      :name  => params[:name]
    )

    redirect "/shipping/services/services"
  end

  get "/shipping/services/services/?" do
    auth_admin
    @service = Service
    erb :"/shipping/services/services"
  end

  get "/shipping/services/:id/edit/?" do
    auth_admin
    @service = Service[params[:id]]
    erb :"/shipping/services/service_edit"
  end

  post "/shipping/services/:id/edit/?" do
    auth_admin
    service = Service[params[:id]]
    service.update(
      :name  => params[:name]
    )

    redirect "/shipping/services/services"
  end

  get "/shipping/services/:id/delete/?" do
    auth_admin
    service = Service[params[:id]]
    service.destroy
    redirect "/shipping/services/services"
  end
  
end
