class Size < Sequel::Model
  plugin :timestamps

  def sizename 
    if self.size_id.nil?
      "unknown"
    else
      self.size.points
    end
  end
  
  one_to_many :costs
end
