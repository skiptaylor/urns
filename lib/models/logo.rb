class Logo < Sequel::Model
  plugin :timestamps

  many_to_one :distributor
  one_to_one :photo
end
