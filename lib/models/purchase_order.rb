class PurchaseOrder < Sequel::Model
  plugin :timestamps

  many_to_one :distributor
end
