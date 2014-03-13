Sequel.migration do
  change do
    create_table(:states) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :name
      String :abbr

      Integer :region_id
    end
  end
end
