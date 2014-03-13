Sequel.migration do
  change do
    create_table(:shopping_cart_items) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :shopping_session

      Integer :quantity, default: 1

      Integer :product_id
    end
  end
end
