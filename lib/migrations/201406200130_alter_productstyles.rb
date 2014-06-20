Sequel.migration do
  change do
    alter_table(:productstyles) do
      add_column :description_pet, String, :text => true
    end
  end
end
