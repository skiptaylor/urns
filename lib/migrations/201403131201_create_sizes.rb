Sequel.migration do
  change do
    create_table(:sizes) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      Integer :points
      String  :container
    end
  end
end
