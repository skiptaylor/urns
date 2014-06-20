class Routes < Urns::Base

  get "/product/productstyle_pet/productstyles/?" do
    @productstyle_pet = Productstyle_pet.all
    erb :"/product/productstyle_pet/productstyles"
  end

  get "/product/productstyle_pet/new/?" do
    @productstyle_pet = Productstyle_pet.new
    erb :"/product/productstyle_pet/productstyle_edit"
  end

  post "/product/productstyle_pet/new/?" do
    productstyle_pet = Productstyle_pet.create(
      :product_style  => params[:product_style],
      :description    => params[:description],
  )
    redirect "/product/productstyle_pet/productstyles"
  end

  get "/product/productstyle_pet/:id/productstyle/?" do
    @productstyle_pet = Productstyle_pet[params[:id]]
    erb :"/product/productstyle_pet"
  end

  get "/product/productstyle_pet/:id/edit/?" do
    @productstyle_pet = Productstyle_pet[params[:id]]
    erb :"/product/productstyle_pet/productstyle_edit"
  end

  post "/product/productstyle_pet/:id/edit/?" do
    productstyle_pet = Productstyle_pet[params[:id]]
    productstyle_pet.update(
      :product_style  => params[:product_style],
      :description    => params[:description],
    )
    redirect "/product/productstyle_pet/productstyles"
  end

  get "/product/productstyle_pet/:id/delete/?" do
    productstyle_pet = Productstyle_pet[params[:id]]
    productstyle_pet.destroy
    redirect "/product/productstyle_pet/productstyles"
  end 
  
end      