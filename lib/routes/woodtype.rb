class Routes < Urns::Base

  get "/product/woodtype/woodtypes/?" do
    auth_admin
    @woodtype = Woodtype.all
    erb :"/product/woodtype/woodtypes"
  end

  get "/product/woodtype/new/?" do
    auth_admin
    @woodtype = Woodtype.new
    erb :"/product/woodtype/woodtype_edit"
  end

  post "/product/woodtype/new/?" do
    auth_admin
    woodtype = Woodtype.create(
      :wood_type    => params[:wood_type],
  )
    redirect "/product/woodtype/woodtypes"
  end

  get "/product/woodtype/:id/woodtype/?" do
    auth_admin
    @woodtype = Woodtype[params[:id]]
    erb :"/product/woodtype/woodtype"
  end

  get "/product/woodtype/:id/edit/?" do
    auth_admin
    @woodtype = Woodtype[params[:id]]
    erb :"/product/woodtype/woodtype_edit"
  end

  post "/product/woodtype/:id/edit/?" do
    auth_admin
    woodtype = Woodtype[params[:id]]
    woodtype.update(
      :wood_type    => params[:wood_type],
    )
    redirect "/product/woodtype/woodtypes"
  end

  get "/product/woodtype/:id/delete/?" do
    auth_admin
    woodtype = Woodtype[params[:id]]
    woodtype.destroy
    redirect "/product/woodtype/woodtypes"
  end       
  
end