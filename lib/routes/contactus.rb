module Urns
  class Routes < Urns::Base

    get "/contactus/contactuses/?" do
      @contactus = Contactus.all
      erb :"/admin/dashboard, layout: "/layout_product".to_sym
    end

    get "/contactus/new/?" do
      @contactus = Contactus.new
      erb :"/contactus/contact-us"
    end

    post "/contactus/new/?" do
      contactus = Contactus.create(
        :name       => params[:name],
        :company    => params[:company],
        :email      => params[:email],
        :phone      => params[:phone],
        :comment    => params[:comment]
    )
      params[:read]    ? contactus.update(:read true)    : contactus.update(:read false)

      redirect "/contactus/thank-you"
    end


    get "/contactus/:id/edit/?" do
      @contactus = Contactus[params[:id]]
      erb :"/contactus/contactus_edit", layout: "/layout_product".to_sym
    end

    post "/contactus/:id/edit/?" do
      contactus = Contactus[params[:id]]
      contactus.update(
      :name       => params[:name],
      :company    => params[:company],
      :email      => params[:email],
      :phone      => params[:phone],
      :comment    => params[:comment]
      )
      params[:read]    ? contactus.update(:read true)    : contactus.update(:read false)

      redirect "/admin/dashboard"
    end

    get "/contactus/:id/delete/?" do
      contactus = Contactus[params[:id]]
      contactus.destroy
      redirect "/admin/dashboard"
    end
  end
end