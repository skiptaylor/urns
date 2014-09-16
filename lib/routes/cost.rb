class Routes < Urns::Base
  
  get "/shipping/costs/new/?" do
    auth_admin
    @service = Service.all
    @zone = Zone.all
    @size = Size.all
    @cost = Cost.new
    erb :"/shipping/costs/cost_edit"
  end

  post "/shipping/costs/new/?" do
    auth_admin
    Cost.create(
      :amount       => params[:amount],
      :service_id   => params[:service],
      :zone_id      => params[:zone],
      :size_id      => params[:size]
    )

    redirect "/shipping/costs/costs"
  end

  get "/shipping/costs/costs/?" do
    auth_admin
    @cost = Cost.order(:amount)
    erb :"/shipping/costs/costs"
  end

  get "/shipping/costs/:id/edit/?" do
    auth_admin
    @service = Service.all
    @zone = Zone.all
    @size = Size.all
    @cost = Cost[params[:id]]
    erb :"/shipping/costs/cost_edit"
  end

  post "/shipping/costs/:id/edit/?" do
    auth_admin
    cost = Cost[params[:id]]
    cost.update(
    :amount       => params[:amount],
    :service_id   => params[:service],
    :zone_id      => params[:zone],
    :size_id      => params[:size]
    )

    redirect "/shipping/costs/costs"
  end

  get "/shipping/costs/:id/delete/?" do
    auth_admin
    cost = Cost[params[:id]]
    cost.destroy
    redirect "/shipping/costs/costs"
  end
  
end
