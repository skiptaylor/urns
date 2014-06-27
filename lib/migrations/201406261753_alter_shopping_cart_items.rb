Sequel.migration do
  change do
    alter_table(:shopping_cart_items) do

      add_column :font, String
      add_column :line1, String
      add_column :line2, String
      add_column :line3, String
      add_column :comment, String
      add_column :plaque_style, String
      
    end
  end
end
