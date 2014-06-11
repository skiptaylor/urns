class Routes < Urns::Base

  get "/woodsource/woodsources/?" do
    @woodsource = Woodsource
    erb :"/woodsource/woodsources"
  end

  get "/woodsource/woodsources/new/?" do
    @woodsource = Woodsource.new
    erb :"/woodsource/woodsource_edit"
  end

  post "/woodsource/woodsources/new/?" do
    woodsource = Woodsource.create(
      :source           => params[:source],
      :description    => params[:description]
  )
    redirect "/woodsource/woodsource_edit"
  end

  get "/woodsource/:id/woodsource/?" do
    @woodsource = Woodsource[params[:id]]
    erb :"/woodsource/woodsource"
  end

  get "/woodsource/:id/edit/?" do
    @woodsource = Woodsource[params[:id]]
    erb :"/woodsource/woodsource_edit"
  end

  post "/woodsource/:id/edit/?" do
    woodsource = Woodsource[params[:id]]
    woodsource.update(
      :source           => params[:source],
      :description    => params[:description]
    )
    redirect "/woodsource/woodsources"
  end

  get "/woodsource/:id/delete/?" do
    woodsource = Woodsource[params[:id]]
    woodsource.destroy
    redirect "/woodsource/woodsources"
  end  
  
end     