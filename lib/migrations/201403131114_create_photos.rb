Sequel.migration do
  change do
    create_table(:photos) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      Text :description

      Integer :product_id
      Integer :fader_id
      Integer :logo_id
    end
  end
end
