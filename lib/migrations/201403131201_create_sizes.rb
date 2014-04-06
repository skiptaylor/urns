Sequel.migration do
  change do
    create_table(:sizes) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      Integer :min_points
      Integer :max_points
      String  :container
    end
  end
end
