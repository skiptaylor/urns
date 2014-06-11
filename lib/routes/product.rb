class Routes < Urns::Base

  get "/product/gallery/:range/?" do
    @product = Product.active.filter(wood: 't')
  
    if params[:search] && !params[:search].nil?
      @product = @product.where(Sequel.like(:serial_number, "%#{params[:search]}%"))
    else
      @product = @product.send(params[:range])
      woodtype      = params[:wood_type]   || 'All'
      wood_color1   = params[:wood_color1] || 'All'
      shape         = params[:shape]       || 'All'
     
      @product = @product.by_wood_type(woodtype) unless woodtype == 'All'
      @product = @product.where(wood_color1: wood_color1) unless wood_color1 == 'All'
      @product = @product.where(shape: shape) unless shape == 'All'
    end
    
    @range_title       = range_title(params[:range])
    @range_description = range_desc(params[:range])
    
    erb :"/product/gallery"
  end

  get '/product/:id/show/?' do
    @product = Product[params[:id]]
    erb :"/product/show_product"
  end

end
