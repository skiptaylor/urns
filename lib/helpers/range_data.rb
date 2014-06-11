require 'sinatra/base'

module Urns
  module Helpers
  
    def range_title(range)
      case range
      when 'keepsake'
        'Keepsake'
      when 'individual'
        'Individual'
      when 'companion'
        'Companion'
      when 'niche'
        'Niche Urns'
      when 'fineart'
        'Fine Art'
      when 'accessories'
        'Accessories'
      else
        'Artistic Urns'
      end
    end

    def range_desc(range)
      case range
      when 'keepsake'
        "Keepsake urns are sized to hold a portion of an adult's cremated remains.  Capacities vary from 10 to 185 cubic inches.  Sometimes called sharing urns, they are often used to split remains among more than one family member.  Also popular for scattering over multiple areas, each keepsake urn can be used for a different location.  Many find comfort in keeping a small portion of the remains to remember their loved one, and the keepsake urn is the perfect way to preserve it."
      when 'individual'
        "Individual urns are full size and will contain an adult's entire cremated remains.  The term individual urn refers to an urn with the capacity of about 190 cubic inches or greater.  Physical dimensions will vary depending on total capacity, shape of the urn and the type of top."
      when 'companion'
        "Companion urns are typically 380 cubic inches and greater. They are designed to hold the cremated remains of two adults. Companion urns are often chosen by couples who make the decision to remain together after passing. Many families will choose to purchase a companion urn before both have passed as a personal decision to remain close in eternity."
      when 'niche'
        "Niche urns are full size urns that will contain an adult's entire cremated remains.  They have the physical dimensions that allow them to fit in a 12\" x 12\" x 12\" niche.  Height includes the top, and tops are interchangeable.  Families may be able to swap a top to lower the height.  Niches vary in size; check with the property manager to verify the dimensions of your niche."
      when 'fineart'
        "Fine Art urns are Artistic Urns extreme creations.  These pieces range in sizes from keepsake to individual to companion and vary dramatically in design and outcome.  Many are 'natural edge' urns turned outward resulting in truly one-off works of art.  Others are embellished with gemstones, garnished with custom tops or enhanced with pyrography, relief carving or painting.  These Fine Art urns are our most expensive and most desired pieces."
      when 'accessories'
        "These are Accessories."
      else
        ''
      end
    end

  end
end
