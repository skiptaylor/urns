class Engraving < Sequel::Model
  plugin :timestamps

  many_to_one :product
  
  def acorn_engrave
    if self.engraving.line1 != ""
      @product.id_71.price + 15.00
    elsif self.engraving.line2 != ""
      @product.id_71.price + 30.00
    elsif self.engraving.line3 != ""
      @product.id_71.price + 45.00
    end
  end
  
end
