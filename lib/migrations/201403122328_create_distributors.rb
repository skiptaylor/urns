Sequel.migration do
  change do
    create_table(:distributors) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      Text :name
      Text :notes

      String :type
      String :subdomain
      String :site
      String :phone
      String :phone2
      String :mobile
      String :addr1
      String :addr2
      String :city
      String :state
      String :zip
      String :country, default: 'USA'
      String :discount_code
      String :contact
      String :contact_title
      String :species, default: 'Human'
      String :facility
      String :email
      String :username
      String :password

      Integer :discount_rate
      Integer :logo_id

      Boolean :active,   default: false
      Boolean :allow_po, default: false
    end
  end
end
