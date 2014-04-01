class Service < Sequel::Model
  plugin :timestamps

  one_to_many :zones
  one_to_many :costs
end
