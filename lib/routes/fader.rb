class Routes < Urns::Base

  get "/fader/faders/?" do
    @fader = Fader.all
    erb :"/fader/faders"
  end

  get "/fader/faders/new/?" do
    auth_admin
    @fader = Fader.new
    erb :"/fader/fader_edit"
  end

  post "/fader/faders/new/?" do
    auth_admin
    fader = Fader.create(
      :header         => params[:header],
      :description    => params[:description],
      :notes          => params[:notes],
      :title          => params[:title]
  )
    params[:pet]    ? fader.update(pet: true)    : fader.update(pet: false)
    params[:people] ? fader.update(people: true) : fader.update(people: false)

    if params[:fader]
      Photo.create(
        :source => params[:fader],
        :description  => params[:description],
        :fader_id => fader.id
      )
    end

    redirect "/fader/faders"
  end

  get "/fader/:id/fader/?" do
    @fader = Fader[params[:id]]
    erb :"/fader/fader"
  end

  get "/fader/:id/edit/?" do
    auth_admin
    @fader = Fader[params[:id]]
    erb :"/fader/fader_edit"
  end

  post "/fader/:id/edit/?" do
    auth_admin
    fader = Fader[params[:id]]
    fader.update(
      :header         => params[:header],
      :description    => params[:description],
      :notes          => params[:notes],
      :title          => params[:title]
    )
    params[:pet]    ? fader.update(pet: true)    : fader.update(pet: false)
    params[:people] ? fader.update(people: true) : fader.update(people: false)

    if params[:fader]
      fader.photo.destroy if fader.photo
      Photo.create(
        :source => params[:fader],
        :description  => params[:description],
        :fader_id => fader.id
      )
    end

    redirect "/fader/faders"
  end

  get "/fader/:id/delete/?" do
    auth_admin
    fader = Fader[params[:id]]
    fader.destroy
    redirect "/fader/faders"
  end

end