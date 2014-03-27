Sequel.migration do
  change do
    create_table(:costs) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :cost

      Integer :size_id
    end
  end
end
