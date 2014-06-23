class Routes < Urns::Base

  get "/distributor/:distributor_id/logo/new/?" do
    @distributor = Distributor[params[:distributor_id]]
    @logo = Logo.new
    erb :"/distributor/logo/logo_edit"
  end

  post "/distributor/:distributor_id/logo/new/?" do
    distributor = Distributor.where(id: params[:distributor_id]).first
    logo = Logo.create(
      :distributor_id   => params[:distributor_id],
      :logo_notes       => params[:logo_notes]
    )
    
    distributor.update(logo_id: logo.id)
    
    if params[:logo]
      logo.photo.destroy if logo.photo
      Photo.create(
        :source       => params[:logo],
        :description  => params[:description],
        :logo_id      => logo.id
      )
    end
  
    redirect "/distributor/#{params[:distributor_id]}/distributor"
  end
  
  get "/distributor/:distributor_id/logos/?" do
    @distributor = Distributor[params[:distributor_id]]
    @logo = Logo
    erb :"distributor/logo/logos"
  end

  # get "/distributor/:distributor_id/logo/:id/edit/?" do
#     @distributor = Distributor[params[:distributor_id]]
#     @logo = Logo[params[:id]]
#     erb :"distributor/logo/logo_edit"
#   end
#
#   post "/distributor/:distributor_id/logo/:id/edit/?" do
#     distributor = Distributor.where(id: params[:distributor_id]).first
#     logo = Logo[params[:id]]
#     logo.update(
#       :logo_notes       => params[:logo_notes]
#     )
#     if params[:logo]
#       logo.photo.destroy if logo.photo
#       Photo.create(
#         :source       => params[:logo],
#         :description  => params[:description],
#         :logo_id      => logo.id
#       )
#     end
#
#     redirect "/distributor/#{params[:distributor_id]}/distributor"
#   end
  
  get "/distributor/:distributor_id/logo/:logo_id/logo/?" do
    @distributor = Distributor[params[:distributor_id]]
    @logo = Logo[params[:id]]
    erb :"distributor/logo/logo"
  end
  
  get "/distributor/:distributor_id/logo/:id/delete/?" do
    distributor = Distributor[params[:distributor_id]]
    logo = Logo[params[:id]]
    logo.destroy
    redirect "/distributor/#{params[:distributor_id]}/edit"
  end

end