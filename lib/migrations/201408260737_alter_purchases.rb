Sequel.migration do
  change do
    alter_table(:purchases) do
      
      add_column :po_number, String
      add_column :po_date, String
      add_column :po_phone, String
      add_column :po_contact, String
      add_column :po_email, String
      add_column :po_contract_number, String
      add_column :ship_requirements, String
      add_column :po_rep, String
      add_column :po_notes, String
      
    end
  end
end