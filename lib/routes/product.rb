class Routes < Urns::Base

  get '/product/products/?' do
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
    @product = Product.new
    erb :"/product/product_edit"
  end

  post '/product/new/?' do
    product = Product.create(
      :serial_number   => params[:serial_number],
      :status          => params[:status],
      :manufacturer    => params[:manufacturer],
      :sku             => params[:sku],
      :type            => params[:type],
      :artist          => params[:artist],
      :statement       => params[:statement],
      :height          => params[:height],
      :width           => params[:width],
      :depth           => params[:depth],
      :shape           => params[:shape],
      :top             => params[:top],
      :top_material    => params[:top_material],
      :capacity        => params[:capacity],
      :price           => params[:price],
      :quantity        => params[:quantity],
      :material2       => params[:material2],
      :material3       => params[:material3],
      :material4       => params[:material4],
      :wood_color1     => params[:wood_color1],
      :wood_color2     => params[:wood_color2],
      :notes           => params[:notes],
      :material_id     => params[:materialid],
      :origin_id       => params[:originid],
      :productstyle_id => params[:productstyleid],
      :ds1             => params[:ds1],
      :ds2             => params[:ds2],
      :ds3             => params[:ds3],
      :finishing       => params[:finishing],
      :photo           => params[:photo],
      :complete        => params[:complete],
      :sold_on         => params[:sold_on],
      :volume          => params[:volume]
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
    @product = Product[params[:id]]
    erb :"/product/product"
  end

  get '/product/:id/edit/?' do
    @product = Product[params[:id]]
    erb :"/product/product_edit"
  end

  post '/product/:id/edit/?' do
    product = Product[params[:id]]
    product.update(
      :serial_number   => params[:serial_number],
      :status          => params[:status],
      :manufacturer    => params[:manufacturer],
      :sku             => params[:sku],
      :type            => params[:type],
      :artist          => params[:artist],
      :statement       => params[:statement],
      :height          => params[:height],
      :width           => params[:width],
      :depth           => params[:depth],
      :shape           => params[:shape],
      :top             => params[:top],
      :top_material    => params[:top_material],
      :capacity        => params[:capacity],
      :price           => params[:price],
      :quantity        => params[:quantity],
      :material2       => params[:material2],
      :material3       => params[:material3],
      :material4       => params[:material4],
      :wood_color1     => params[:wood_color1],
      :wood_color2     => params[:wood_color2],
      :notes           => params[:notes],
      :material_id     => params[:materialid],
      :origin_id       => params[:originid],
      :productstyle_id => params[:productstyleid],
      :ds1             => params[:ds1],
      :ds2             => params[:ds2],
      :ds3             => params[:ds3],
      :finishing       => params[:finishing],
      :photo           => params[:photo],
      :complete        => params[:complete],
      :sold_on         => params[:sold_on],
      :volume          => params[:volume]
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
    product = Product[params[:id]]
    product.destroy
    redirect "/product/products"
  end

  # get "/product/gallery/:range/?" do
  #   @product = Product.all
  # 
  #   if params[:search] && !params[:search].nil?
  #     @product = @product.all(:serial_number.like => "%#{params[:search]}%")
  #   else
  #   
  #   @product = Product.send(params[:range])
  #   woodtype      = params[:wood_type]  || 'All'
  #   shape         = params[:shape]      || 'All'
  # 
  #   @product = @product.by_wood_type(woodtype) unless woodtype == 'All'
  #   @product = @product.all(shape: shape) unless shape == 'All'
  #   
  # end
  # 
  #   case params[:range]
  #   when "keepsake"
  #   @range_title = "Keepsake"
  #   @range_description = 'Keepsake urns are sized to hold a portion of an adult\'s cremated remains.  Capacities vary from 10 to 185 cubic inches.  Sometimes called sharing urns, they are often used to split remains among more than one family member.  Also popular for scattering over multiple areas, each keepsake urn can be used for a different location.  Many find comfort in keeping a small portion of the remains to remember their loved one, and the keepsake urn is the perfect way to preserve it.'
  #   when 'large'
  #   @range_title = 'Individual'
  #   @range_description = 'Individual urns are full size and will contain an adult\'s entire cremated remains.  The term individual urn refers to an urn with the capacity of about 190 cubic inches or greater.  Physical dimensions will vary depending on total capacity, shape of the urn and the type of top.'
  #   when 'companion'
  #   @range_title = 'Companion'
  #   @range_description = 'Companion urns are typically 380 cubic inches and greater. They are designed to hold the cremated remains of two adults. Companion urns are often chosen by couples who make the decision to remain together after passing. Many families will choose to purchase a companion urn before both have passed as a personal decision to remain close in eternity.'
  #   when 'niche'
  #   @range_title = 'Niche'
  #   @range_description = 'Niche urns are full size urns that will contain an adult\'s entire cremated remains.  They have the physical dimensions that allow them to fit in a 12" x 12" x 12" niche.  Height includes the top, and tops are interchangeable.  Families may be able to swap a top to lower the height.  Niches vary in size; check with the property manager to verify the dimensions of your niche.'
  #   when 'fineart'
  #   @range_title = 'Fine Art'
  #   @range_description = 'Fine Art urns are Artistic Urns extreme creations.  These pieces range in sizes from keepsake to individual to companion and vary dramatically in design and outcome.  Many are \'natural edge\' urns turned outward resulting in truly one-off works of art.  Others are embellished with gemstones, garnished with custom tops or enhanced with pyrography, relief carving or painting.  These Fine Art urns are our most expensive and most desired pieces.'
  #   when 'accessories'
  #   @range_title = 'Accessories'
  #   @range_description = 'These are Accessories'
  #   else
  #   @range_title = 'Artistic Urns'
  #   @range_description = ''
  #   end
  # 
  #   erb :"/product/gallery"
  # end
  # 
  # get '/product/:id/show/?' do
  #   @product = Product[params[:id]]
  #   erb :"/product/show_product"
  # end
  
end
