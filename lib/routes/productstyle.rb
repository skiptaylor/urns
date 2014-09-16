class Routes < Urns::Base

  get "/product/productstyle/productstyles/?" do
    auth_admin
    @productstyle = Productstyle.all
    erb :"/product/productstyle/productstyles"
  end

  get "/product/productstyle/new/?" do
    auth_admin
    @productstyle = Productstyle.new
    erb :"/product/productstyle/productstyle_edit"
  end

  post "/product/productstyle/new/?" do
    auth_admin
    productstyle = Productstyle.create(
      :product_style      => params[:product_style],
      :description        => params[:description],
      :description_pet    => params[:description_pet]
  )
    redirect "/product/productstyle/productstyles"
  end

  get "/product/productstyle/:id/productstyle/?" do
    auth_admin
    @productstyle = Productstyle[params[:id]]
    erb :"/product/productstyle"
  end

  get "/product/productstyle/:id/edit/?" do
    auth_admin
    @productstyle = Productstyle[params[:id]]
    erb :"/product/productstyle/productstyle_edit"
  end

  post "/product/productstyle/:id/edit/?" do
    auth_admin
    productstyle = Productstyle[params[:id]]
    productstyle.update(
    :product_style      => params[:product_style],
    :description        => params[:description],
    :description_pet    => params[:description_pet]
    )
    redirect "/product/productstyle/productstyles"
  end

  get "/product/productstyle/:id/delete/?" do
    auth_admin
    productstyle = Productstyle[params[:id]]
    productstyle.destroy
    redirect "/product/productstyle/productstyles"
  end 
  
end      