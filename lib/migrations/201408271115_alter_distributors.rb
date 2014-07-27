Sequel.migration do
  change do
    alter_table(:distributors) do
      
      add_column :state_id, Integer
      
    end
  end
end
