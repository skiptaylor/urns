Sequel.migration do
  change do
    alter_table(:products) do

      add_column :font, String
      add_column :line1, String
      add_column :line2, String
      add_column :line3, String
      add_column :comment, String
      
      add_column :allow_engraving, String
      add_column :require_engraving, String
      
      add_column :price_engraving, Float

    end
  end
end
