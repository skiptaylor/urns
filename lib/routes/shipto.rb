class Routes < Urns::Base

  get "/distributor/:distributor_id/shiptos/new/?" do
    @distributor = Distributor[params[:distributor_id]]
    @shipto = Shipto.new
    erb :"/distributor/shipto_edit" 
  end

  post "/distributor/:distributor_id/shiptos/new/?" do
    distributor = Distributor[params[:distributor_id]]
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
      :distributor_id => params[:distributor_id]
    )
    
    redirect "/distributor/#{params[:distributor_id]}/shiptos"
  end

  get "/distributor/:distributor_id/shiptos/?" do
    @distributor = Distributor[params[:distributor_id]]
    shipto = Shipto
    erb :"/distributor/shiptos"
  end

  get "/distributor/:distributor_id/shiptos/:id/edit/?" do
    @distributor = Distributor[params[:distributor_id]]
    @shipto = Shipto[params[:id]]
    erb :"/distributor/shipto_edit" 
  end

  post "/distributor/:distributor_id/shiptos/:id/edit/?" do
    distributor = Distributor[params[:distributor_id]]
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
      :distributor_id => params[:distributor_id]
    )
    
    redirect "/distributor/#{params[:distributor_id]}/shiptos"
  end

  get "/distributor/:distributor_id/shiptos/:id/delete/?" do
    distributor = Distributor[params[:distributor_id]]
    shipto = Shipto[params[:id]]
    shipto.destroy
    redirect "/distributor/#{params[:distributor_id]}/shiptos"
  end 
  
end