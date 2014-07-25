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
  
  get '/shopping_cart_item/:id/edit/?' do
    @item = ShoppingCartItem[params[:id]]
    erb :"/checkout/engrave"
  end
  
  post '/shopping_cart_item/:id/edit/?' do
    item = ShoppingCartItem[params[:id]]
    item.update(
      :font           => params[:font],
      :line1          => params[:line1],
      :line2          => params[:line2],
      :line3          => params[:line3],
      :comment        => params[:comment],
      :plaque_style   => params[:plaque_style]
    )

    redirect '/checkout/index'
  end
  
  get '/shopping_cart_item/:id/engrave_edit/?' do
    @item = ShoppingCartItem[params[:id]]
    erb :"/admin/engrave_edit"
  end
  
  post '/shopping_cart_item/:id/engrave_edit/?' do
    item = ShoppingCartItem[params[:id]]
    item.update(
      :font           => params[:font],
      :line1          => params[:line1],
      :line2          => params[:line2],
      :line3          => params[:line3],
      :comment        => params[:comment],
      :plaque_style   => params[:plaque_style]
    )

    redirect request.referrer
  end
  
  get '/product/:id/remove-from-cart/?' do
    ShoppingCartItem.remove_from_cart(session[:shopping_session], params[:id])
    redirect request.referrer
  end
  
end
