Sequel.migration do
  change do
    create_table(:productstyles_pet) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :product_style, default: '0'

      Text :description
    end
  end
end
