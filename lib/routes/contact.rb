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
      :comment    => params[:comment],
      :read       => params[:read]
    )
    Email.contact(contact.name, contact.company, contact.email, contact.phone, contact.comment)
  
    redirect "/contactus/thank-you"
  end
  
  get "/contact/:id/edit/?" do
    auth_admin
    @contact = Contact[params[:id]]
    erb :"/contact/contact_edit"
  end

  post "/contact/:id/edit/?" do
    auth_admin
    contact = Contact[params[:id]]
    contact.update(
      :name       => params[:name],
      :company    => params[:company],
      :email      => params[:email],
      :phone      => params[:phone],
      :comment    => params[:comment],
      :read       => params[:read]
    )

    redirect "/admin/dashboard"
  end

  get "/contact/:id/contact/?" do
    auth_admin
    @contact = Contact[params[:id]]
    erb :"/contact/contact"
  end

  get "/contact/:id/delete/?" do
    auth_admin
    contact = Contact[params[:id]]
    contact.destroy
    redirect "/admin/dashboard"
  end

end
