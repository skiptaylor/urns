class Size < Sequel::Model
  plugin :timestamps

  one_to_many :costs
  many_to_one :service
end
