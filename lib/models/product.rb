class Product < Sequel::Model
  plugin :timestamps

  many_to_one :material
  many_to_one :origin
  many_to_one :productstyle

  one_to_many :photos
  one_to_many :engravings
end
