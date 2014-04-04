class State < Sequel::Model
  plugin :timestamps
  
  many_to_one :zone
  one_to_many :purchase
end
