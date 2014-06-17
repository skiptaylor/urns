Sequel.migration do
  change do
    alter_table(:shiptos) do
      add_column :phone, String
    end
  end
end
