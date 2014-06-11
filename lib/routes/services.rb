class Routes < Urns::Base

  get "/shipping/services/new/?" do
    @service = Service.new
    erb :"/shipping/services/service_edit"
  end

  post "/shipping/services/new/?" do
    service = Service.create(
      :name  => params[:name]
    )

    redirect "/shipping/services/services"
  end

  get "/shipping/services/services/?" do
    @service = Service
    erb :"/shipping/services/services"
  end

  get "/shipping/services/:id/edit/?" do
    @service = Service[params[:id]]
    erb :"/shipping/services/service_edit"
  end

  post "/shipping/services/:id/edit/?" do
    service = Service[params[:id]]
    service.update(
      :name  => params[:name]
    )

    redirect "/shipping/services/services"
  end

  get "/shipping/services/:id/delete/?" do
    service = Service[params[:id]]
    service.destroy
    redirect "/shipping/services/services"
  end
  
end
