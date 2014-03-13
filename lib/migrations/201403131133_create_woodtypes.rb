Sequel.migration do
  change do
    create_table(:woodtypes) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :wood_type, default: 'Tree Type'
    end
  end
end
