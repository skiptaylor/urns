class Routes < Urns::Base
  
  before do
    session[:favs] ||= []
  end

  get '/product/:id/add-to-favs/?' do
      session[:favs] << params[:id]
      session[:favs].uniq!
      redirect request.referrer
  end

  get '/product/favs/?' do
    @product = Product.where(:id => session[:favs])
    erb :"/product/favs"
  end

  get '/product/:id/remove-from-favs/?' do
    (session[:favs]).delete(params[:id])
    redirect request.referrer
  end

  # Product.all(:id => session[:favs])



  # session[:favs] << params[:id].to_i


  # redirect request.referrer

  # []
  
end