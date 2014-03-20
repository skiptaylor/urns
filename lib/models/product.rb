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
    all(:capacity > 2, :capacity <= 10)
  end
  def self.small
    all(:capacity > 10, :capacity <= 30)
  end
  def self.medium
    all(:capacity > 30, :capacity <= 60)
  end
  def self.large
    all(:capacity > 60, :capacity <= 90)
  end
  def self.extra
    all(:capacity > 90, :capacity <= 185)
  end
  def self.keepsake
    all(:capacity > 2, :capacity <= 185)
  end
  def self.individual
    all(:capacity > 185, :capacity <= 390)
  end
  def self.companion
    all(:capacity > 390, :capacity <= 799)
  end
  def self.equine
    all(:capacity > 800)
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
    all(:capacity > 2, :capacity <= 7)
  end
  def self.medium
    all(:capacity > 6, :capacity <= 13)
  end
  def self.large
    all(:volume > 12, :capacity <= 18)
  end
  def self.xlarge
    all(:capacity > 17)
  end
end
