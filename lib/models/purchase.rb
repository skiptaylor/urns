class Purchase < Sequel::Model
  plugin :timestamps

  many_to_one :distributor
  one_to_many :items
  one_to_many :states
end
