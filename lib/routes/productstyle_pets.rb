class Routes < Urns::Base

  get "/product/productstyle_pets/productstyles/?" do
    @productstyle_pets = Productstyle_pets.all
    erb :"/product/productstyle_pets/productstyles"
  end

  get "/product/productstyle_pets/new/?" do
    @productstyle_pets = Productstyle_pets.new
    erb :"/product/productstyle_pets/productstyle_edit"
  end

  post "/product/productstyle_pets/new/?" do
    productstyle_pets = Productstyle_pets.create(
      :product_style  => params[:product_style],
      :description    => params[:description],
  )
    redirect "/product/productstyle_pets/productstyles"
  end

  get "/product/productstyle_pets/:id/productstyle/?" do
    @productstyle_pets = Productstyle_pets[params[:id]]
    erb :"/product/productstyle_pets"
  end

  get "/product/productstyle_pets/:id/edit/?" do
    @productstyle_pets = Productstyle_pets[params[:id]]
    erb :"/product/productstyle_pets/productstyle_edit"
  end

  post "/product/productstyle_pets/:id/edit/?" do
    productstyle_pets = Productstyle_pets[params[:id]]
    productstyle_pets.update(
      :product_style  => params[:product_style],
      :description    => params[:description],
    )
    redirect "/product/productstyle_pets/productstyles"
  end

  get "/product/productstyle_pets/:id/delete/?" do
    productstyle_pets = Productstyle_pets[params[:id]]
    productstyle_pets.destroy
    redirect "/product/productstyle_pets/productstyles"
  end 
  
end      