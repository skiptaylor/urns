Sequel.migration do
  change do
    create_table(:sizes) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :points

      Integer :shipmethod_id
    end
  end
end
