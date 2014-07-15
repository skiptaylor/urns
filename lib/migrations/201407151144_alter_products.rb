Sequel.migration do
  change do
    alter_table(:products) do

      add_column :wood_color3, String
      
    end
  end
end
