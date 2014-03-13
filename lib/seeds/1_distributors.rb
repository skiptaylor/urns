data = "#{File.dirname(__FILE__)}/../data/distributors.csv"

CSV.open(data, { headers: true }) do |csv_lines|
  csv_lines.each do |line|
    Distributor.unrestrict_primary_key
    Distributor.create(
      id:             line['id'].to_i,
      name:           line['name'],
      subdomain:      line['subdomain'],
      type:           line['type'],
      site:           line['site'],
      phone:          line['phone'],
      phone2:         line['phone2'],
      mobile:         line['mobile'],
      addr1:          line['addr1'],
      addr2:          line['addr2'],
      city:           line['city'],
      state:          line['state'],
      zip:            line['zip'],
      country:        line['country'],
      notes:          line['notes'],
      discount_code:  line['discount_code'],
      discount_rate:  line['discount_rate'],
      contact:        line['contact'],
      contact_title:  line['contact_title'],
      species:        line['species'],
      facility:       line['facility'],
      email:          line['email'],
      active:         true
    )
  end
end
