module Urns
  class Routes < Urns::Base

    get "/contact/contacts/?" do
      @contact = Contact.all
      erb :"/admin/dashboard", layout: "/layout_product".to_sym
    end

    get "/contact/new/?" do
      @contact = Contact.new
      erb :"/contactus/contact-us"
    end

    post "/contact/new/?" do
      contactus = Contactus.create(
        :name       => params[:name],
        :company    => params[:company],
        :email      => params[:email],
        :phone      => params[:phone],
        :comment    => params[:comment]
    )
      params[:read]    ? contact.update(read: true)    : contact.update(read: false)

      redirect "/contactus/thank-you"
    end


    get "/contact/:id/edit/?" do
      @contactus = Contactus[params[:id]]
      erb :"/contactus/contact_edit", layout: "/layout_product".to_sym
    end

    post "/contact/:id/edit/?" do
      contact = Contact[params[:id]]
      contacs.update(
      :name       => params[:name],
      :company    => params[:company],
      :email      => params[:email],
      :phone      => params[:phone],
      :comment    => params[:comment]
      )
      params[:read]    ? contact.update(read: true)    : contact.update(read: false)

      redirect "/admin/dashboard"
    end

    get "/contact/:id/delete/?" do
      contact = Contact[params[:id]]
      contact.destroy
      redirect "/admin/dashboard"
    end
  end
end