Sequel.migration do
  change do
    create_table(:regions) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :region
    end
  end
end
