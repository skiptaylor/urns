Sequel.migration do
  change do
    alter_table(:contacts) do
      add_column :read, FalseClass :l
    end
  end
end
