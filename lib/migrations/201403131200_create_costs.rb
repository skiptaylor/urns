Sequel.migration do
  change do
    create_table(:costs) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      Float   :amount

      Integer :zone_id
      Integer :service_id
      Integer :size_id
    end
  end
end
