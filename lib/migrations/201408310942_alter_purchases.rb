Sequel.migration do
  change do
    alter_table(:purchases) do
      
      add_column :total, String

      
    end
  end
end