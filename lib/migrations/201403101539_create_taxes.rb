migration 'create taxes table' do
  database.create_table :taxes do
    primary_key :id

    DateTime :created_at
    DateTime :updated_at

    String :zip
    Float  :rate
  end
end
