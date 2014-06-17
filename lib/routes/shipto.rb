class Routes < Urns::Base

  get "/distributor/:id/shipto/new/?" do
    distributor = Distributor[params[:id]]
    @shipto = Shipto.new
    erb :"/distributor/shipto_edit" 
  end

  post "/distributor/:id/shipto/new/?" do
    distributor = Distributor[params[:id]]
    Shipto.create(
      :addr1          => params[:addr1],
      :addr2          => params[:addr2],
      :city           => params[:city],
      :state          => params[:state],
      :zip            => params[:zip],
      :country        => params[:country],
      :notes          => params[:notes],
      :contact        => params[:contact],
      :phone          => params[:phone],
      :facility_name  => params[:facility_name],
      :distributor_id => params[:id]
    )
    
    redirect "/distributor/#{params[:id]}/shiptos"
  end

  get "/distributor/:id/shiptos/?" do
    @distributor = Distributor[params[:id]]
    shipto = Shipto
    erb :"/distributor/shiptos"
  end

  get "/distributor/:distributor_id/shipto/:id/edit/?" do
    distributor = Distributor[params[:id]]
    @shipto = Shipto[params[:id]]
    erb :"/distributor/shipto_edit" 
  end

  post "/distributor/:distributor_id/shipto/:id/edit/?" do
    distributor = Distributor[params[:id]]
    shipto = Shipto[params[:id]]
    shipto.update(
      :addr1          => params[:addr1],
      :addr2          => params[:addr2],
      :city           => params[:city],
      :state          => params[:state],
      :zip            => params[:zip],
      :country        => params[:country],
      :notes          => params[:notes],
      :facility_name  => params[:facility_name],
      :contact        => params[:contact],
      :phone          => params[:phone],
      :distributor_id => params[:id]
    )
    
    redirect "/distributor/#{params[:id]}/shiptos"
  end

  get "/distributor/:distributor_id/shipto/:id/delete/?" do
    distributor = Distributor[params[:id]]
    shipto = Shipto[params[:id]]
    shipto.destroy
    redirect "/distributor/#{params[:id]}/shiptos"
  end 
  
end