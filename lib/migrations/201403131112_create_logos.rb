Sequel.migration do
  change do
    create_table(:logos) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      Text :logo_notes

      Integer :distributor_id
    end
  end
end
