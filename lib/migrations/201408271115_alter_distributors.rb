Sequel.migration do
  change do
    alter_table(:distributors) do
      
      Integer :state_id
      
    end
  end
end
