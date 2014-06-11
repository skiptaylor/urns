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

  end
end