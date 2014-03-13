# data = "#{File.dirname(__FILE__)}/../data/style.csv"
#
# CSV.open(data, { headers: true }) do |csv_lines|
#   csv_lines.each do |line|
#     Productstyle.unrestrict_primary_key
#     Productstyle.create(
#       id:               line['id'].to_i,
#       product_style:    line['style'],
#     )
#   end
# end
