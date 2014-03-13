class Distributor < Sequel::Model
  plugin :timestamps

  many_to_one :logo
end
