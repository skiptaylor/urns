Sequel.migration do
  change do
    create_table(:items) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :item

      Integer :quantity

      Float :price
      Float :total

      Integer :purchase_id
    end
  end
end
