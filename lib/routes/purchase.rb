class Routes < Urns::Base

  get "/checkout/creditcard/?" do
    @purchase = Purchase.all
    erb :"/checkout/checkout"
  end
  
  get "/purchase/new/?" do
    @state = State.all
    @service = Service.all
    unless @purchase = Purchase.where(shopping_session: session[:shopping_session]).first
      @purchase = Purchase.create(shopping_session: session[:shopping_session])
      if session[:distributor]
        @distributor = Distributor[session[:distributor]]
        @purchase.name = @distributor.name
        @purchase.address1 = @distributor.addr1
        @purchase.address2 = @distributor.addr2
        @purchase.city = @distributor.city
        @purchase.zip = @distributor.zip
        @purchase.billing_state_id = @distributor.state_id
        @purchase.email = @distributor.email
      end
    end
    
    erb :"/checkout/checkout"
  end

  post "/purchase/new/?" do
    purchase = Purchase.where(shopping_session: session[:shopping_session]).first
    purchase.update(
      :stripe_id           => params[:stripe_id],
      :tax                 => params[:tax],
      :shipping            => params[:shipping],
      :amount              => params[:amount],
      :name                => params[:name],
      :email               => params[:email],
      :phone               => params[:phone],
      :address1            => params[:address1],
      :address2            => params[:address2],
      :city                => params[:city],
      :zip                 => params[:zip],
      :ship_name           => params[:ship_name],
      :ship_address1       => params[:ship_address1],
      :ship_address2       => params[:ship_address2],
      :ship_city           => params[:ship_city],
      :ship_zip            => params[:ship_zip],
      :referral_code       => params[:referral_code],
      :shipped_on          => params[:shipped_on],
      :received_on         => params[:received_on],
      :tracking_number     => params[:tracking_number],
      :total               => params[:total],
      :service_id          => params[:service],
      :po_number           => params[:po_number],
      :po_date             => params[:po_date],
      :po_phone            => params[:po_phone],
      :po_contact          => params[:po_contact],
      :po_email            => params[:po_email],
      :po_contract_number  => params[:po_contract_number],
      :ship_requirements   => params[:ship_requirements],
      :po_rep              => params[:po_rep],
      :po_notes            => params[:po_notes],
      :shopping_session    => session[:shopping_session],
      :distributor_id      => params[:distributor_id]
    )
    
    if @purchase.shipping_state == nil
      flash[:alert] = 'You must enter a shipping state.'
    else
      redirect "/purchase/#{purchase.id}/confirm"
    end
  end
  
  get "/distributor/:id/purchases/?" do
    @state = State.all
    @service = Service.all
    @distributor = Distributor.where[session[:distributor]]
    @purchase = Purchase.where(shopping_session: session[:shopping_session])
    erb :"/distributor/purchase_orders"
    # redirect "/distributor/#{distributor.id}/purchase_orders"
  end

  post '/purchase/shipping-cost/?' do
      purchase = Purchase.where(shopping_session: session[:shopping_session]).first
      purchase.update(billing_state_id: params[:billing_state], shipping_state_id: params[:shipping_state], service_id: params[:service])
      volume = purchase.shipping_volume
      if volume > 0 && volume <= 100
        "%.2f" % purchase.shipping_cost
      else
        "0.00"
      end
  end

  get "/purchase/:id/confirm/?" do
    @purchase = Purchase[params[:id]]
    @service = Service.all
    @product = Product.all
    @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    @total = ShoppingCartItem.total(session[:shopping_session])
    @purchase.total = @total
    erb :"/checkout/confirm"
  end

  post "/purchase/:id/confirm/?" do
    purchase = Purchase[params[:id]]
    amount = (purchase.grand_total * 100).to_i
		
    unless session[:distributor] 
      begin
  			# Replace with correct key.
  			Stripe.api_key = "sk_test_MU5HRrdbS4avG42f6nYl2Xiv"
  			token = params[:stripeToken]
    		charge = Stripe::Charge.create(
    			# Amount should be the total cost in cents.
      		:amount => amount,
  		    :currency => "usd",
  		    :card => token,
  		    :description => 'aui wood purchase'
  		  )
      
  			# Do whatever needs to be done to mark the Purchase as completed and the
  			# ShoppingCartItems as purchased and unavailable.
        purchase.cart_items.each do |item|
          product = item.product
          product.quantity = product.quantity - 1
          # if product.quantity < 0
          #   # Do something to flag the product as sold out?
          # end
          unless product.accessories
            product.status = "Sold"
          end
          product.save
        end
      
        purchase.stripe_id  = charge.id
        purchase.shipping   = purchase.shipping_cost
        purchase.amount     = purchase.grand_total
        purchase.tax        = purchase.tax_rate
        purchase.save

        session[:shopping_session] = nil
      
  		  erb :"/checkout/paid"
  		rescue Stripe::CardError => e
        # The card has been declined
  			erb :"/checkout/error"
  		end
    else
      
      purchase.cart_items.each do |item|
        product = item.product
        product.quantity = product.quantity - 1
        # if product.quantity < 0
        #   # Do something to flag the product as sold out?
        # end
        unless product.accessories
          product.status = "Sold"
        end
        product.save
      end
      
      purchase.shipping   = purchase.shipping_cost
      purchase.amount     = purchase.grand_total
      purchase.tax        = purchase.tax_rate
      purchase.save

      session[:shopping_session] = nil
      
      erb :"/checkout/paid"
    end
  end
  
  # get "/purchase/:id/purchase_order/?" do
  #   @purchase = Purchase[params[:id]]
  #   @distributor = Distributor.where[session[:distributor]]
  #   @service = Service.all
  #   @product = Product.all
  #   @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
  #   @total = ShoppingCartItem.total(session[:shopping_session])
  #   erb :"/checkout/purchase_order"
  # end
  #
  # post "/purchase/:id/purchase_order/?" do
  #   purchase = Purchase[params[:id]]
  #   amount = (purchase.grand_total * 100).to_i
  #     begin
  #     purchase.cart_items.each do |item|
  #       product = item.product
  #       product.quantity = product.quantity - 1
  #       unless product.accessories
  #         product.status = "Sold"
  #       end
  #       product.save
  #     end
  #
  #     purchase.billing_state  = distributor.state
  #     purchase.shipping       = purchase.shipping_cost
  #     purchase.amount         = purchase.grand_total
  #     purchase.tax            = purchase.tax_rate
  #     purchase.save
  #
  #     session[:shopping_session] = nil
  #
  #     erb :"/index"
  #
  # end
  
  get "/admin/purchase/:id/purchase/?" do
    @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    @total = ShoppingCartItem.total(session[:shopping_session])
    @state = State.all
    @item = Item.all
    @purchase = Purchase[params[:id]]
    erb :"/admin/purchase"
  end

  get "/admin/purchases/?" do
    @purchase = Purchase[params[:id]]
    @service = Service.all
    @product = Product.all
    @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    @total = ShoppingCartItem.total(session[:shopping_session])
    @purchase = Purchase.all
    erb :"/admin/purchases"
  end
  
  get "/admin/purchase/:id/edit/?" do
    @cart = ShoppingCartItem.where(shopping_session: session[:shopping_session])
    @total = ShoppingCartItem.total(session[:shopping_session])
    @state = State.all
    @item = Item.all
    @purchase = Purchase[params[:id]]
    erb :"/admin/purchase_edit"
  end

  post "/admin/purchase/:id/edit/?" do
    total = ShoppingCartItem.total(session[:shopping_session])
    purchase = Purchase[params[:id]]
    purchase.update(
      :shipped_on         => params[:shipped_on],
      :received_on        => params[:received_on],
      :tracking_number    => params[:tracking_number]
    )

    redirect "/admin/purchases"
  end

  get "/admin/purchase/:id/delete/?" do
    purchase = Purchase[params[:id]]
    purchase.destroy
    redirect "/admin/purchases"
  end

end
