class Routes < Urns::Base

  before do
    session[:shopping_session] ||= Time.now.strftime('%Y%m%d%H%M%S%L').to_s
  end

  get '/product/:id/add-to-cart/?' do
    ShoppingCartItem.first_or_increment(session[:shopping_session], params[:id])
    redirect request.referrer
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
      :quantity  => params[:quantity]
    )
    redirect '/checkout/index'
  end

  get '/checkout/index/remove-all/?' do
    ShoppingCartItem.destroy
    redirect '/checkout/index'
  end

  get '/product/:id/remove-from-cart/?' do
    ShoppingCartItem.remove_from_cart(session[:shopping_session], params[:id])
    redirect request.referrer
  end
  
end