Sequel.migration do
  change do
    create_table(:products) do
      primary_key :id

      DateTime :created_at
      DateTime :updated_at

      String :serial_number, size: 255
      String :status, default: ''
      String :manufacturer, default: 'Artistic Urns'
      String :sku
      String :type
      String :artist
      String :shape, default: ''
      String :top
      String :top_material, size: 255
      String :material_old, size: 255
      String :style_old, size: 255
      String :material2, size: 255
      String :material3
      String :material4
      String :wood_color1
      String :wood_color2
      String :ds1
      String :ds2
      String :ds3
      String :finishing
      String :photo
      String :complete
      String :sold_on

      Text :statement
      Text :notes

      Float :height
      Float :width
      Float :depth
      Float :price

      Integer :capacity
      Integer :quantity
      Integer :volume, default: 1

      Boolean :reliquary, default: false
      Boolean :niche, default: false
      Boolean :usa, default: true
      Boolean :green, default: true
      Boolean :threaded, default: false
      Boolean :brass_threaded, default: false
      Boolean :wood, default: false
      Boolean :pet, default: false
      Boolean :accessories, default: false

      Integer :material_id
      Integer :origin_id
      Integer :productstyle_id
    end
  end
end
