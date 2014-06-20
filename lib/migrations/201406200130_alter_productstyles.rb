Sequel.migration do
  change do
    alter_table(:productstyles) do
      add_column :description_pet, text
    end
  end
end
