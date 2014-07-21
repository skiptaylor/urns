class Routes < Urns::Base

  before do
    session[:shopping_session] ||= Time.now.strftime('%Y%m%d%H%M%S%L').to_s
  end

  get '/product/:id/add-to-cart/?' do
    ShoppingCartItem.first_or_increment(session[:shopping_session], params[:id])
    redirect request.referrer
  end
  
  get '/product/:id/accessories/?' do
    ShoppingCartItem.first_or_accessories(session[:shopping_session], params[:id])
    redirect request.referrer
  end
  
  get '/shopping_cart_item/:id/engrave/?' do
    @shoppimg_cart_item = ShoppingCartItem.where[params[:id]]
    redirect '/checkout/<%= @shopping_cart_item.id %>/engrave'
  end
  
  post '/shopping_cart_item/:id/engrave/?' do
    shoppimg_cart_item = ShoppingCartItem.where[params[:id]]
    item.update(
      :font           => params[:font],
      :line1          => params[:line1],
      :line2          => params[:line2],
      :line3          => params[:line3],
      :comment        => params[:comment],
      :plaque_style   => params[:plaque_style]
    )

    redirect '/checkout/<%= @shopping_cart_item.id %>/index'
  end
    
  get '/product/:id/decrement-from-cart/?' do
    ShoppingCartItem.decrement_or_remove(session[:shopping_session], params[:id])
    redirect request.referrer
  end

  get '/checkout/index/?' do
    @product = Product.all
    @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    @total = ShoppingCartItem.total(session[:shopping_session])
    erb :'/checkout/index'
  end
    
  post '/checkout/index/?' do
    product = Product.all
    cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    item.update(
      :quantity       => params[:quantity],
      :font           => params[:font],
      :line1          => params[:line1],
      :line2          => params[:line2],
      :line3          => params[:line3],
      :comment        => params[:comment],
      :plaque_style   => params[:plaque_style]
    )
    redirect '/checkout/index'
  end
  
  get '/checkout/engraving/?' do
    @product = Product[params[:product_id]]
    @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    @total = ShoppingCartItem.total(session[:shopping_session])
    erb :'/checkout/engraving'
  end
    
  post '/checkout/engraving/?' do
    product = Product[params[:product_id]]
    cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    item.create(
      :font           => params[:font],
      :line1          => params[:line1],
      :line2          => params[:line2],
      :line3          => params[:line3],
      :comment        => params[:comment],
      :plaque_style   => params[:plaque_style]
    )
    redirect '/checkout/index'
  end

  # get '/checkout/index/remove-all/?' do
#     ShoppingCartItem.destroy
#     redirect '/checkout/index'
#   end

  get '/product/:id/remove-from-cart/?' do
    ShoppingCartItem.remove_from_cart(session[:shopping_session], params[:id])
    redirect request.referrer
  end
  
  get '/checkout/index/clear_session/?' do
    ShoppingCartItem.remove_from_cart(session[:shopping_session], params[:id])
    redirect request.referrer
  end
  
end
