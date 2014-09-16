class Routes < Urns::Base

  get "/product/origin/origins/?" do
    auth_admin
    @origin = Origin.all
    erb :"/product/origin/origins"
  end

  get "/product/origin/new/?" do
    auth_admin
    @origin = Origin.new
    erb :"/product/origin/origin_edit"
  end

  post "/product/origin/new/?" do
    auth_admin
    origin = Origin.create(
      :chunk          => params[:chunk],
      :description    => params[:description]
  )
    redirect "/product/origin/origins"
  end

  get "/product/origin/:id/origin/?" do
    auth_admin
    @origin = Origin[params[:id]]
    erb :"/product/origin/origin"
  end

  get "/product/origin/:id/edit/?" do
    auth_admin
    @origin = Origin[params[:id]]
    erb :"/product/origin/origin_edit"
  end

  post "/product/origin/:id/edit/?" do
    auth_admin
    origin = Origin[params[:id]]
    origin.update(
      :chunk          => params[:chunk],
      :description    => params[:description]
    )
    redirect "/product/origin/origins"
  end

  get "/product/origin/:id/delete/?" do
    auth_admin
    origin = Origin[params[:id]]
    origin.destroy
    redirect "/product/origin/origins"
  end 
  
end      