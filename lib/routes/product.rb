class Routes < Urns::Base

  get '/product/products/?' do
    auth_admin
    @product = Product

    if params[:search] && !params[:search].nil?
      @product = @product.where(Sequel.like(:serial_number, "%#{params[:search]}%"))
    else
      woodtype      = params[:wood_type]  || 'All'
      status        = params[:status]     || 'All'
      shape         = params[:shape]      || 'All'
      size          = params[:size]       || 'All'

      # There's no need for an if/else unless
      # the 'if' part does something specific, like with status.
      #
      # "by_wood_type" is a class method I added to the Product model.

      @product = @product.by_wood_type(woodtype) unless woodtype == 'All'
    
      if status == 'All'
        @product = @product.exclude(status: 'Sold')
      else
        @product = @product.filter(status: status)
      end
      
      @product = @product.where(shape: shape) unless shape == 'All'
   
      @product = @product.send(size.to_sym) unless size == 'All' 

    end 
  
    erb :"/product/products"
  end
 
  get '/product/new/?' do
    auth_admin
    @product = Product.new
    erb :"/product/product_edit"
  end

  post '/product/new/?' do
    auth_admin
    product = Product.create(
      :serial_number      => params[:serial_number],
      :status             => params[:status],
      :manufacturer       => params[:manufacturer],
      :sku                => params[:sku],
      :type               => params[:type],
      :artist             => params[:artist],
      :statement          => params[:statement],
      :height             => params[:height],
      :width              => params[:width],
      :depth              => params[:depth],
      :shape              => params[:shape],
      :top                => params[:top],
      :top_material       => params[:top_material],
      :capacity           => params[:capacity],
      :price              => params[:price],
      :quantity           => params[:quantity],
      :material2          => params[:material2],
      :material3          => params[:material3],
      :material4          => params[:material4],
      :wood_color1        => params[:wood_color1],
      :wood_color2        => params[:wood_color2],
      :wood_color3        => params[:wood_color3],
      :notes              => params[:notes],
      :material_id        => params[:materialid],
      :origin_id          => params[:originid],
      :productstyle_id    => params[:productstyleid],
      :ds1                => params[:ds1],
      :ds2                => params[:ds2],
      :ds3                => params[:ds3],
      :finishing          => params[:finishing],
      :photo              => params[:photo],
      :complete           => params[:complete],
      :sold_on            => params[:sold_on],
      :volume             => params[:volume],
      :allow_engraving    => params[:allow_engraving],
      :require_engraving  => params[:require_engraving],
      :price_engraving    => params[:price_engraving]
    )
  
    params[:reliquary] ? product.update(reliquary: true) : product.update(reliquary: false)
    params[:niche] ? product.update(niche: true) : product.update(niche: false)
    params[:usa] ? product.update(usa: true) : product.update(usa: false)
    params[:green] ? product.update(green: true) : product.update(green: false)
    params[:threaded] ? product.update(threaded: true) : product.update(threaded: false)
    params[:brass_threaded] ? product.update(brass_threaded: true) : product.update(brass_threaded: false)
    params[:wood] ? product.update(wood: true) : product.update(wood: false)
    params[:pet] ? product.update(pet: true) : product.update(pet: false)
    params[:accessories] ? product.update(accessories: true) : product.update(accessories: false)
  
  	File.open("public/images/product/#{product.id}.jpg", 'wb') { |file| file.write(params[:pic][:tempfile].read) } if params[:pic]
	
  	session[:alert] = {
      style: 'alert-success',
      message: 'Product has been created.'
    }
  
    redirect "/product/products"
  end

  get '/product/:id/product/?' do
    auth_admin
    @product = Product[params[:id]]
    @photo = @product.photos
    erb :"/product/product"
  end

  get '/product/:id/edit/?' do
    auth_admin
    @product = Product[params[:id]]
    erb :"/product/product_edit"
  end

  post '/product/:id/edit/?' do
    auth_admin
    product = Product[params[:id]]
    product.update(
      :serial_number      => params[:serial_number],
      :status             => params[:status],
      :manufacturer       => params[:manufacturer],
      :sku                => params[:sku],
      :type               => params[:type],
      :artist             => params[:artist],
      :statement          => params[:statement],
      :height             => params[:height],
      :width              => params[:width],
      :depth              => params[:depth],
      :shape              => params[:shape],
      :top                => params[:top],
      :top_material       => params[:top_material],
      :capacity           => params[:capacity],
      :price              => params[:price],
      :quantity           => params[:quantity],
      :material2          => params[:material2],
      :material3          => params[:material3],
      :material4          => params[:material4],
      :wood_color1        => params[:wood_color1],
      :wood_color2        => params[:wood_color2],
      :wood_color3        => params[:wood_color3],
      :notes              => params[:notes],
      :material_id        => params[:materialid],
      :origin_id          => params[:originid],
      :productstyle_id    => params[:productstyleid],
      :ds1                => params[:ds1],
      :ds2                => params[:ds2],
      :ds3                => params[:ds3],
      :finishing          => params[:finishing],
      :photo              => params[:photo],
      :complete           => params[:complete],
      :sold_on            => params[:sold_on],
      :volume             => params[:volume],
      :allow_engraving    => params[:allow_engraving],
      :require_engraving  => params[:require_engraving],
      :price_engraving    => params[:price_engraving]
    )
  
    params[:reliquary] ? product.update(reliquary: true) : product.update(reliquary: false)
    params[:niche] ? product.update(niche: true) : product.update(niche: false)
    params[:usa] ? product.update(usa: true) : product.update(usa: false)
    params[:green] ? product.update(green: true) : product.update(green: false)
    params[:threaded] ? product.update(threaded: true) : product.update(threaded: false)
    params[:brass_threaded] ? product.update(brass_threaded: true) : product.update(brass_threaded: false)
    params[:wood] ? product.update(wood: true) : product.update(wood: false)
    params[:pet] ? product.update(pet: true) : product.update(pet: false)
    params[:accessories] ? product.update(accessories: true) : product.update(accessories: false)
  
  	File.open("public/images/product/#{product.id}.jpg", 'wb') { |file| file.write(params[:pic][:tempfile].read) } if params[:pic]
	
  	session[:alert] = {
      style: 'alert-success',
      message: 'Product has been updated.'
    }
   
    redirect "/product/#{product.id}/edit"
  end

  get '/product/:id/delete/?' do
    auth_admin
    product = Product[params[:id]]
    product.destroy
    redirect "/product/products"
  end
  
  get "/product/gallery/:range/?" do
    if request.host.include? 'wood'
      @product = Product.active.filter(wood: 't')
    elsif request.host.include? 'pet'
      @product = Product.active.filter(pet: 't')
    else request.host.include? 'localhost'
      @product = Product.active
    end
  
    if params[:search] && !params[:search].nil?
      @product = @product.where(Sequel.like(:serial_number, "%#{params[:search]}%"))
    else
      @product = @product.send(params[:range])
      woodtype      = params[:wood_type]   || 'All'
      wood_color    = params[:wood_color]  || 'All'
      shape         = params[:shape]       || 'All'

      @product = @product.by_wood_type(woodtype) unless woodtype == 'All'
      # @product = @product.where(wood_color1: wood_color1) unless wood_color1 == 'All'
      @product = @product.where(wood_color1: 'light') if wood_color == 'light'
      @product = @product.where(wood_color2: 'dark') if wood_color == 'dark'
      @product = @product.where(wood_color3: 'mixed') if wood_color == 'mixed'
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
  
  get '/product/:id/sold/?' do
    @product = Product[params[:id]]
    erb :"/product/show_sold"
  end

end
