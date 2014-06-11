class Routes < Urns::Base

  get "/states/new/?" do
    auth_admin
    @state = State.new
    erb :"/states/states_edit"
  end

  post "/states/new/?" do
    auth_admin
    state = State.create(
      :name         => params[:name],
      :abbr         => params[:abbr],
      :zone_id      => params[:zone_id]
    )

    redirect "/states/states"
  end

  get "/states/states/?" do
    auth_admin
    @state = State
    erb :"/states/states"
  end

  get "/states/:id/edit/?" do
    auth_admin
    @state = State[params[:id]]
    erb :"/states/states_edit"
  end

  post "/states/:id/edit/?" do
    auth_admin
    state = State[params[:id]]
    state.update(
      :name         => params[:name],
      :abbr         => params[:abbr],
      :zone_id      => params[:zone_id]
    )

    redirect "/states/states"
  end

  get "/states/:id/delete/?" do
    auth_admin
    state = State[params[:id]]
    state.destroy
    redirect "/states/states"
  end

end