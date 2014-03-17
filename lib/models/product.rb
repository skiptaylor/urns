class Product < Sequel::Model
  plugin :timestamps

  many_to_one :material
  many_to_one :origin
  many_to_one :productstyle

  one_to_many :photos
  one_to_many :engravings
  
  def default_photo_url
    if self.photos.count > 0
      self.photos.first.source
    else
      "/img/placeholder.png"
    end
  end
  
  def self.mini
    all(:capacity.gt => 2, :capacity.lte => 10)
  end
  def self.small
    all(:capacity.gt => 10, :capacity.lte => 30)
  end
  def self.medium
    all(:capacity.gt => 30, :capacity.lte => 60)
  end
  def self.large
    all(:capacity.gt => 60, :capacity.lte => 90)
  end
  def self.extra
    all(:capacity.gt => 90, :capacity.lte => 185)
  end
  def self.keepsake
    all(:capacity.gt => 2, :capacity.lt => 185)
  end
  def self.individual
    all(:capacity.gt => 185, :capacity.lte => 390)
  end
  def self.companion
    all(:capacity.gt => 390, :capacity.lte => 799)
  end
  def self.equine
    all(:capacity.gt => 800)
  end
  def self.by_wood_type(wood_type)
    Woodtype.all(wood_type: wood_type).materials.all.products
  end
  def self.active
    all(status: 'Active')
  end
  def self.fineart
    Productstyle.all(product_style: 'Fine Art').all.products
  end
  def self.niche
    all(niche: 't')
  end
  def self.accessories
    all(accessories: 't')
  end
  
  def self.small
    all(:capacity.gt => 0, :capacity.lt => 7)
  end
  def self.medium
    all(:capacity.gt => 6, :capacity.lt => 13)
  end
  def self.large
    all(:volume.gt => 12, :capacity.lt => 18)
  end
  def self.xlarge
    all(:capacity.gt => 17)
  end
end
