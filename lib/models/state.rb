class State < Sequel::Model
  plugin :timestamps
  
  many_to_one :zone
  many_to_one :purchase
end
