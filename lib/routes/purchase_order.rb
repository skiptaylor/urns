class Routes < Urns::Base

  get "/distributor/:distributor_id/purchase_order/new/?" do
    @distributor = Distributor[params[:distributor_id]]
    @purchase_order = PurchaseOrder.new
    erb :"/distributor/purchase_order_edit"
  end

  post "/distributor/:distributor_id/purchase_order/new/?" do
    distributor = Distributor[params[:distributor_id]]
    PurchaseOrder.create(
      :po_number      => params[:po_number],
      :po_date        => params[:po_date],
      :method         => params[:method],
      :distributor_id => params[:distributor_id]
    )
  
    redirect "/distributor/#{params[:id]}/purchase_order"
  end
  
  get "/distributor/:id/purchase_orders/?" do
    @distributor = Distributor[session[:distributor]]
    @purchase_order = PurchaseOrder.all
    erb :"/distributor/purchase_orders"
  end

  get "/distributor/:distributor_id/purchase_order/:id/purchase_order/?" do
    @distributor = Distributor[params[:distributor_id]]
    @purchase_order = PurchaseOrder[params[:id]]
    erb :"/distributor/purchase_order" 
  end


  get "/distributor/:distributor_id/purchase_order/:id/edit/?" do
    @distributor = Distributor[params[:distributor_id]]
    @purchase_order = PurchaseOrder[params[:id]]
    erb :"/distributor/purchase_order_edit" 
  end

  post "/distributor/:distributor_id/purchase_order/:id/edit/?" do
    distributor = Distributor[params[:distributor_id]]
    purchase_order = PurchaseOrder[params[:id]]
    purchase_order.update(
      :po_number      => params[:po_number],
      :po_date        => params[:po_date],
      :method         => params[:method],
      :distributor_id => params[:distributor_id]
    )
    
    redirect "/distributor/#{params[:distributor_id]}/purchase_orders"
  end

  get "/distributor/:distributor_id/purchase_order/:id/delete/?" do
    distributor = Distributor[params[:distributor_id]]
    purchase_order = PurchaseOrder[params[:id]]
    purchase_order.destroy
    redirect "/distributor/#{params[:distributor_id]}/purchase_orders"
  end 
  
end