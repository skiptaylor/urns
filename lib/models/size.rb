class Size < Sequel::Model
  plugin :timestamps

  one_to_many :costs
end
