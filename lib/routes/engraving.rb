class Routes < Urns::Base

  get "/acorn/new/?" do
    @product = Product[:id => 71]
    @engraving = Engraving.new
    erb :"/acorn" 
  end

  post "/acorn/new/?" do
    engraving = Engraving.create(
      :line1          => params[:line1],
      :line2          => params[:line2],
      :line3          => params[:line3],
      :font           => params[:font],
      :comment        => params[:comment],
      :product_id     => params[:product]
    )
    
    redirect "/checkout/index"
  end
  
end