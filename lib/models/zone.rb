class Zone < Sequel::Model
  plugin :timestamps

  def zonename 
    if self.zone_id.nil?
      "unknown"
    else
      self.zone.name
    end
  end
  
  one_to_many :states
  one_to_many :costs
  many_to_one :service
end
