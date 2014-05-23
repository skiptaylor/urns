Sequel.migration do
  change do
    create_table(:contactus) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String  :name
      String  :company
      String  :email
      String  :phone
      Text    :comment
      Boolean :read

    end
  end
end
