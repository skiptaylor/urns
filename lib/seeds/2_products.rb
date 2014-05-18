data = "#{File.dirname(__FILE__)}/../data/product.csv"

CSV.open(data, { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Product.unrestrict_primary_key
    Product.create(
      id:               line['id'].to_i,
      serial_number:    line['serial_number'],
      notes:            line['description'],
      height:           line['height'].to_f,
      width:            line['width'].to_f,
      capacity:         line['capacity'].to_i,
      price:            line['price'].to_f,
      quantity:         line['quantity'].to_i,
      created_at:       line['created_at'],
      updated_at:       line['updated_at'],
      top_material:     line['finial'],
      material_old:     line['material'],
      style_old:        line['style'],
      productstyle_id:  6,
      origin_id:        2,
      depth:            0
    )
  end
end
