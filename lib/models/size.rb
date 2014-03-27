class Size < Sequel::Model
  plugin :timestamps

  one_to_many :zones
  many_to_one :cost
end
