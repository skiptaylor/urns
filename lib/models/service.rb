class Service < Sequel::Model
  plugin :timestamps

  many_to_one :zone
  one_to_many :sizes
end
