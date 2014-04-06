class State < Sequel::Model
  plugin :timestamps
  
  many_to_one :zone

  def billing_purchases
    Purchase.where(billing_state_id: self.id)
  end

  def shipping_purchases
    Purchase.where(shipping_state_id: self.id)
  end
end
