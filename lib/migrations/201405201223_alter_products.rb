Sequel.migration do
  change do
    alter_table(:products) do
      add_column :fineart, Boolean, :default=>false
    end
  end
end
