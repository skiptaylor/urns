class Routes < Urns::Base

  get "/shipping/sizes/new/?" do
    @size = Size.new
    erb :"/shipping/sizes/size_edit"
  end

  post "/shipping/sizes/new/?" do
    size = Size.create(
      :min_points   => params[:min_points],
      :max_points   => params[:max_points],
      :container    => params[:container]
    )

    redirect "/shipping/sizes/sizes"
  end

  get "/shipping/sizes/sizes/?" do
    @size = Size.all
    erb :"/shipping/sizes/sizes"
  end

  get "/shipping/sizes/:id/edit/?" do
    @size = Size[params[:id]]
    erb :"/shipping/sizes/size_edit"
  end

  post "/shipping/sizes/:id/edit/?" do
    size = Size[params[:id]]
    size.update(
      :min_points   => params[:min_points],
      :max_points   => params[:max_points],
      :container    => params[:container]
    )

    redirect "/shipping/sizes/sizes"
  end

  get "/shipping/sizes/:id/delete/?" do
    size = Size[params[:id]]
    size.destroy
    redirect "/shipping/sizes/sizes"
  end

end