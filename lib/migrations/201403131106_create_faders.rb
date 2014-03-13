Sequel.migration do
  change do
    create_table(:faders) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :header

      Text :description
      Text :notes

      Boolean :pet,    default: true
      Boolean :people, default: true
    end
  end
end
