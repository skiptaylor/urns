Sequel.migration do
  change do
    create_table(:shipmethods) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :shipmethod

    end
  end
end
