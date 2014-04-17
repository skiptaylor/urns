class Distributor < Sequel::Model
  plugin :timestamps

  one_to_many :logos

  one_to_many :purchase_orders
  one_to_many :shiptos
  
  def self.dist_people
    all(species: 'Human')
  end
  
end
