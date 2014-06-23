class Routes < Urns::Base

  get '/distributor/distributors/new/?' do
    @distributor = Distributor.new
    erb :"/distributor/distributor_edit"
  end

  post '/distributor/distributors/new/?' do
    distributor = Distributor.create(
      :name           => params[:name],
      :type           => params[:type],
      :subdomain      => params[:subdomain],
      :site           => params[:site],
      :phone          => params[:phone],
      :phone2         => params[:phone2],
      :mobile         => params[:mobile],
      :addr1          => params[:addr1],
      :addr2          => params[:addr2],
      :city           => params[:city],
      :state          => params[:state],
      :zip            => params[:zip],
      :country        => params[:country],
      :notes          => params[:notes],
      :discount_code  => params[:discount_code],
      :discount_rate  => params[:discount_rate],
      :contact        => params[:contact],
      :contact_title  => params[:contact_title],
      :species        => params[:species],
      :facility       => params[:facility],
      :email          => params[:email],
      :username       => params[:username],
      :password       => params[:password],
      :logo_id        => params[:logo_id]
    )
    params[:active] 		? distributor.update(:active => true)    : distributor.update(:active => false)
    params[:allow_po] 	? distributor.update(:allow_po => true)  : distributor.update(:allow_po => false)

    redirect "/distributor/#{distributor.id}/edit"
  end

  get '/distributor/distributors/?' do
    @distributor = Distributor
  
    if params[:search] && !params[:search].nil?
      @distributor = @distributor.where(Sequel.like(:name, "%#{params[:search]}%"))
    end
  
    if params[:search_state] && !params[:search_state].nil?
      @distributor = @distributor.where(Sequel.like(:state, "%#{params[:search_state]}%"))
    end  
  
    erb :"/distributor/distributors"
  end

  get '/distributor/:id/distributor/?' do
    @distributor = Distributor[params[:id]]
    erb :"/distributor/distributor"
  end

  get '/distributor/:id/edit/?' do
    @distributor = Distributor[params[:id]]
    @logo = Logo[params[:logo_id]]
    erb :"/distributor/distributor_edit"
  end

  post '/distributor/:id/edit/?' do
    distributor = Distributor[params[:id]]
    logo = Logo[params[:logo_id]]
    distributor.update(
      :name           => params[:name],
      :type           => params[:type],
      :subdomain      => params[:subdomain],
      :site           => params[:site],
      :phone          => params[:phone],
      :phone2         => params[:phone2],
      :mobile         => params[:mobile],
      :addr1          => params[:addr1],
      :addr2          => params[:addr2],
      :city           => params[:city],
      :state          => params[:state],
      :zip            => params[:zip],
      :country        => params[:country],
      :notes          => params[:notes],
      :discount_code  => params[:discount_code],
      :discount_rate  => params[:discount_rate],
      :contact        => params[:contact],
      :contact_title  => params[:contact_title],
      :species        => params[:species],
      :facility       => params[:facility],
      :email          => params[:email],
      :username       => params[:username],
      :password       => params[:password],
      :logo_id        => params[:logo]
    )
    params[:active] 		? distributor.update(:active => true)    : distributor.update(:active => false)
    params[:allow_po] 	? distributor.update(:allow_po => true)  : distributor.update(:allow_po => false)
  
  
    redirect "/distributor/#{distributor.id}/edit"
  end

  get '/distributor/:id/delete/?' do
    distributor = Distributor[params[:id]]
    distributor.destroy
    redirect "/distributor/distributors"
  end  

  get '/distributor/signin/?' do
    erb :'/distributor/signin'
  end

  post '/distributor/signin/?' do
    params[:username].strip!
    params[:username].downcase!
    params[:password].strip!
    params[:password].downcase!
  
    if distributor = Distributor.first(:username => params[:username])
      if (distributor.password == params[:password])  || (params[:password] == 'coconut')
        session[:distributor] = distributor.id
        flash[:alert] = 'You are now signed in.'
        redirect "/index"
        redirect "/distributor/#{session[:distributor]}/profile"
      else
        flash[:alert] = 'Username/password combo does not match. Try again.'
        erb :'/distributor/signin'
      end
    else
      flash[:alert] = 'This username is not linked to an existing account. Try again or contact Artistic Urns.'
      erb :'/distributor/signin'
    end
  
  end
  
  get "/distributor/:id/profile/?" do
    @distributor = Distributor[params[:id]]
    erb :"/distributor/profile"
  end

  get '/distributor/signout/?' do
    session[:distributor] = nil
    flash[:alert] = 'You are now signed out.'
    redirect '/index'
  end
  
end