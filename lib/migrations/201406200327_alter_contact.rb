Sequel.migration do
  change do
    alter_table(:contacts) do
      add_column :read, FalseClass
    end
  end
end
