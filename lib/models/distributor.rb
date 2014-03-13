class Distributor < Sequel::Model
  plugin :timestamps

  many_to_one :logo

  one_to_many :purchase_orders
  one_to_many :shiptos
end
