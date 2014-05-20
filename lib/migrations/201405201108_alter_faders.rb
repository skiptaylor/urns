Sequel.migration do
  change do
    alter_table(:faders) do
      add_column :title, String
    end
  end
end
