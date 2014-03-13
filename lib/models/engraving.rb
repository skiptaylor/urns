class Engraving < Sequel::Model
  plugin :timestamps

  many_to_one :product
end
