module Urns
  class Routes < Urns::Base

    get "/contact/new/?" do
      @contact = Contact.new
      erb :"/contactus/contact-us"
    end

    post "/contact/new/?" do
      contact = Contact.create(
        :name       => params[:name],
        :company    => params[:company],
        :email      => params[:email],
        :phone      => params[:phone],
        :comment    => params[:comment]
    )

      redirect "/contactus/thank-you"
    end
    
    get "/contact/:id/edit/?" do
      @contact = Contact[params[:id]]
      erb :"/contact/contact_edit"
    end
  
    post "/contact/:id/edit/?" do
      contact = Contact[params[:id]]
      contact.update(
      :name       => params[:name],
      :company    => params[:company],
      :email      => params[:email],
      :phone      => params[:phone],
      :comment    => params[:comment]
      )

      redirect "/admin/dashboard"
    end
  
    get "/contact/:id/contact/?" do
      @contact = Contact[params[:id]]
      erb :"/contact/contact"
    end

    get "/contact/:id/delete/?" do
      contact = Contact[params[:id]]
      contact.destroy
      redirect "/admin/dashboard"
    end

  end
end