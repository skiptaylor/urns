class ShoppingCartItem < Sequel::Model
  plugin :timestamps

  many_to_one :product
  
  def self.first_or_increment(shopping_session, product_id)
    shopping_cart_item = nil
    if item = ShoppingCartItem.first(shopping_session: shopping_session, product_id: product_id)
      item.update(quantity: item.quantity + 0)
      shopping_cart_item = item
    else
      shopping_cart_item = ShoppingCartItem.create(shopping_session: shopping_session, product_id: product_id)
    end
    shopping_cart_item
  end
  
  def self.first_or_engrave(shopping_session, product_id)
    shopping_cart_item = nil
    shopping_cart_item = ShoppingCartItem.create(shopping_session: shopping_session, product_id: product_id)
    shopping_cart_item
  end
  
  def self.decrement_or_remove(shopping_session, product_id)
    if item = ShoppingCartItem.first(shopping_session: shopping_session, product_id: product_id)
      item.update(quantity: item.quantity - 1)
      item.destroy if item.quantity == 0
    end
  end
  
  def self.remove_from_cart(shopping_session, product_id)
    if item = ShoppingCartItem.first(shopping_session: shopping_session, product_id: product_id)
      item.destroy
    end
  end
  
  def price
    (self.product.price * self.quantity).to_f
  end
  
  def self.total(shopping_session)
    total = 0
    ShoppingCartItem.where(shopping_session: shopping_session).each do |item|
      total += item.price
    end
    (total*100).round / 100.0 # Round and truncate for dollar value
  end
  
end
