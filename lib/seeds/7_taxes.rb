data = "#{File.dirname(__FILE__)}/../data/taxes.csv"

CSV.open(data, { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Tax.create(
      zip: line['ZipCode'],
      rate: line['CombinedRate']
    )
  end
end
