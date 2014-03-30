class Zone < Sequel::Model
  plugin :timestamps

  many_to_one :zone
  one_to_many :sizes
end
