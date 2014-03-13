class Item < Sequel::Model
  plugin :timestamps

  many_to_one :purchase
end
