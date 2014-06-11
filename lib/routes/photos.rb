class Routes < Urns::Base

  get "/product/:product_id/photos/new/?" do
    auth_admin
    @product = Product[params[:product_id]]
    @photo = Photo.new
    erb :"/product/photos/photo_edit"
  end

  post "/product/:product_id/photos/new/?" do
    auth_admin
    @product = Product[params[:product_id]]
    photo = Photo.create(
      :source       => params[:source],
      :description  => params[:description],
      :product_id   => params[:product_id]
    )
  
    session[:alert] = {
      style: 'alert-success',
      message: 'Photo added!'
    }
    redirect "/product/#{params[:product_id]}/photos/photos"
  end

  get "/product/:product_id/photos/:id/photo/?" do
    auth_admin
    @product = Product[params[:product_id]]
    @photo = Photo[params[:id]]
    erb :"/product/photos/photo",
  end

  get "/product/:product_id/photos/:id/edit/?" do
    auth_admin
    @product = Product[params[:product_id]]
    @photo = Photo[params[:id]]
    erb :"/product/photos/photo_edit"
  end

  post "/product/:product_id/photos/:id/edit/?" do
    auth_admin
    @product = Product[params[:product_id]]
    photo = Photo[params[:id]]
    photo.update(
      :source       => params[:source],
      :description  => params[:description]
    )
  
    redirect "/product/#{params[:product_id]}/photos/photos"
  end

  get "/product/:product_id/photos/photos/?" do
    auth_admin
    @product = Product[params[:product_id]]
    @photo = @product.photos
    erb :"/product/photos/photos"
  end

  get "/product/:product_id/photos/:id/delete/?" do
    auth_admin
    product = Product[params[:product_id]]
    photo = Photo[params[:id]]
    photo.destroy
    redirect "/product/#{params[:product_id]}/photos/photos"
  end  
  
end     