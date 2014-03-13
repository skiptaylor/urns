Sequel.migration do
  change do
    create_table(:engravings) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :font
      String :line1
      String :line2
      String :line3

      Text :comment

      Integer :product_id
    end
  end
end
