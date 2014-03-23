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

  dataset_module do

    def mini
      where 'capacity > 2 and capacity <= 7'
    end

    def small
      where 'capacity > 8 and capacity <= 30'
    end

    def medium
      where 'capacity > 31 and capacity <= 60'
    end

    def large
      where 'capacity > 61 and capacity <= 90'
    end

    def vlarge
      where 'capacity > 90 and capacity <= 189'
    end

    def keepsake
      where 'capacity > 2 and capacity <= 185'
    end

    def individual
      where 'capacity > 185 and capacity <= 390'
    end

    def companion
      where 'capacity > 390 and capacity <= 799'
    end

    def equine
      where 'capacity > 799'
    end

    def by_wood_type(wood_type)
      where(material_id: Material.where(woodtype_id: Woodtype.where(wood_type: wood_type).select(:id)).select(:id))
    end

    def active
      where status: 'Active'
    end

    def fineart
      where(productstyle_id: Productstyle.where(product_style: 'Fine Art').select(:id))
    end

    def niche
      where niche: 't'
    end

    def accessories
      where accessories: 't'
    end

  end

end
