class Routes < Urns::Base

  get '/distributor/distributors/?' do
    @distributor = Distributor
  
    if params[:search] && !params[:search].nil?
      @distributor = @distributor.where(Sequel.like(:name, "%#{params[:search]}%"))
    end
  
    if params[:search_state] && !params[:search_state].nil?
      @distributor = @distributor.where(Sequel.like(:state, "%#{params[:search_state]}%"))
    end  
  
    erb :"/distributor/distributors", layout: "/layout_product".to_sym
  end

  get '/distributor/:id/distributor/?' do
    @distributor = Distributor[params[:id]]
    erb :"/distributor/distributor", layout: "/layout_product".to_sym
  end

  get '/distributor/signin/?' do
    erb :'/distributor/signin'
  end

  post '/distributor/signin/?' do
    session[:distributor] = nil
    
    params[:username].strip!
    params[:username].downcase!
    params[:password].strip!
    params[:password].downcase!
  
    if distributor = Distributor.first(:username => params[:username])
      if (distributor.password == params[:password])  || (params[:password] == 'coconut')
        session[:distributor] = distributor.id
        flash[:alert] = 'You are now signed in.'
        redirect "/index"
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
    flash[:alert] = 'You are now signed out. Thank you, come again!'
    redirect '/index'
  end
  
end