Sequel.migration do
  change do
    create_table(:shiptos) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :addr1
      String :addr2
      String :city
      String :state
      String :zip
      String :country, default: 'USA'
      String :contact, default: 'Attn: '

      Text :notes
      Text :facility_name

      Integer :distributor_id
    end
  end
end
