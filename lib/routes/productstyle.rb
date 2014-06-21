class Routes < Urns::Base

  get "/product/productstyle/productstyles/?" do
    @productstyle = Productstyle.all
    erb :"/product/productstyle/productstyles"
  end

  get "/product/productstyle/new/?" do
    @productstyle = Productstyle.new
    erb :"/product/productstyle/productstyle_edit"
  end

  post "/product/productstyle/new/?" do
    productstyle = Productstyle.create(
      :product_style      => params[:product_style],
      :description        => params[:description],
      :description_pet    => params[:description_pet]
  )
    redirect "/product/productstyle/productstyles"
  end

  get "/product/productstyle/:id/productstyle/?" do
    @productstyle = Productstyle[params[:id]]
    erb :"/product/productstyle"
  end

  get "/product/productstyle/:id/edit/?" do
    @productstyle = Productstyle[params[:id]]
    erb :"/product/productstyle/productstyle_edit"
  end

  post "/product/productstyle/:id/edit/?" do
    productstyle = Productstyle[params[:id]]
    productstyle.update(
    :product_style      => params[:product_style],
    :description        => params[:description],
    :description_pet    => params[:description_pet]
    )
    redirect "/product/productstyle/productstyles"
  end

  get "/product/productstyle/:id/delete/?" do
    productstyle = Productstyle[params[:id]]
    productstyle.destroy
    redirect "/product/productstyle/productstyles"
  end 
  
end      