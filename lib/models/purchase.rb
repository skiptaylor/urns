class Purchase < Sequel::Model
  plugin :timestamps

  many_to_one :distributor
  one_to_many :items

  def billing_state
    if self.billing_state_id
      State[self.billing_state_id]
    else
      nil
    end
  end
  
  def shipping_state
    if self.shipping_state_id
      State[self.shipping_state_id]
    else
      nil
    end
  end

end
