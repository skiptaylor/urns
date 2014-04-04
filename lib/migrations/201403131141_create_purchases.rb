Sequel.migration do
  change do
    create_table(:purchases) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :stripe_id
      String :name
      String :email
      String :phone
      String :address1
      String :address2
      String :city
      String :zip
      String :ship_name
      String :ship_address1
      String :ship_address2
      String :ship_city
      String :ship_zip
      String :referral_code
      String :tracking_number

      Float :tax
      Float :shipping
      Float :amount

      Date :shipped_on
      Date :received_on

      Boolean :approved, default: false
      Boolean :sold, default: false

      Integer :distributor_id
      Integer :state_id
      Integer :shipstate_id
      Integer :zone_id
    end
  end
end
