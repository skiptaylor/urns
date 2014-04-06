class Purchase < Sequel::Model
  plugin :timestamps

  many_to_one :distributor
  many_to_one :service
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

  def shipping_cost
    Cost.where(size_id: self.shipping_size,
            service_id: self.service_id,
               zone_id: self.zone).first.amount
  end

  def zone
    if self.shipping_state
      self.shipping_state.zone_id
    else
      self.billing_state.zone_id
    end
  end

  def cart_items
    ShoppingCartItem.where(shopping_session: self.shopping_session)
  end

  def shipping_volume
    volume = 0
    self.cart_items.each |item|
      volume += item.product.volume
    end
    volume
  end

  def shipping_size
    points = self.shipping_volume
    Size.where('min_points <= ? and max_points >= ?', points, points).first.id
  end

end
