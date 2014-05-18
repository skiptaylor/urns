Sequel.migration do
  change do
    create_table(:materials) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :material_type, default: 'none'

      Text :description

      Integer :woodtype_id
    end
  end
end
