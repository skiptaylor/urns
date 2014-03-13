class Material < Sequel::Model
  plugin :timestamps

  one_to_many :products
  many_to_one :woodtype
end
