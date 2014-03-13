Sequel.migration do
  change do
    create_table(:origins) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :chunk, default: '0'

      Text :description
    end
  end
end
