Sequel.migration do
  change do
    create_table(:purchase_orders) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :po_number
      String :method

      Date :po_date, default: Chronic.parse('now')

      Text :ship_to

      Integer :distributor_id
    end
  end
end
