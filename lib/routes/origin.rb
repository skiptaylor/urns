class Routes < Urns::Base

  get "/product/origin/origins/?" do
    @origin = Origin.all
    erb :"/product/origin/origins"
  end

  get "/product/origin/new/?" do
    @origin = Origin.new
    erb :"/product/origin/origin_edit"
  end

  post "/product/origin/new/?" do
    origin = Origin.create(
      :chunk          => params[:chunk],
      :description    => params[:description]
  )
    redirect "/product/origin/origins"
  end

  get "/product/origin/:id/origin/?" do
    @origin = Origin[params[:id]]
    erb :"/product/origin/origin"
  end

  get "/product/origin/:id/edit/?" do
    @origin = Origin[params[:id]]
    erb :"/product/origin/origin_edit"
  end

  post "/product/origin/:id/edit/?" do
    origin = Origin[params[:id]]
    origin.update(
      :chunk          => params[:chunk],
      :description    => params[:description]
    )
    redirect "/product/origin/origins"
  end

  get "/product/origin/:id/delete/?" do
    origin = Origin[params[:id]]
    origin.destroy
    redirect "/product/origin/origins"
  end 
  
end      