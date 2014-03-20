class Distributor < Sequel::Model
  plugin :timestamps

  many_to_one :logo

  one_to_many :purchase_orders
  one_to_many :shiptos
  
  def self.dist_people
    all(species: 'Human')
  end
  
end
