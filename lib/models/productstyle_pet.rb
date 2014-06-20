class Productstyle_pets < Sequel::Model
  plugin :timestamps

  one_to_many :products
end
