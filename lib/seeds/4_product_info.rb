# Seed files in the ./data/seeds directory can be run one at a time, or all at once:
#  ~: rake dm:seed[users]
# or
#  ~: rake db:seed:all

# User.create email: 'johndoe@example.com', password: 'secret123'


box = Woodtype.create(
  :wood_type  => 'Box Elder'
)

elder = Woodtype.create(
  :wood_type  => 'Camphor'
)

cedar = Woodtype.create(
  :wood_type  => 'Cedar'
)

cherry = Woodtype.create(
  :wood_type  => 'Cherry'
)

maple = Woodtype.create(
  :wood_type  => 'Maple'
)

oak = Woodtype.create(
  :wood_type  => 'Oak'
)

pecan = Woodtype.create(
  :wood_type  => 'Pecan'
)

pine = Woodtype.create(
  :wood_type  => 'Pine'
)

poplar = Woodtype.create(
  :wood_type  => 'Poplar'
)

sycamore = Woodtype.create(
  :wood_type  => 'Sycamore'
)

walnut = Woodtype.create(
  :wood_type  => 'Walnut'
)

ash = Woodtype.create(
  :wood_type  => 'Ash'
)

birch = Woodtype.create(
  :wood_type  => 'Birch'
)

butternut = Woodtype.create(
  :wood_type  => 'Butternut'
)

gum = Woodtype.create(
  :wood_type  => 'Gum'
)

hickory = Woodtype.create(
  :wood_type  => 'Hickory'
)

magnolia = Woodtype.create(
  :wood_type  => 'Magnolia'
)

other = Woodtype.create(
  :wood_type  => 'Other'
)




material1 = Material.create(
  :material_type  => 'Ambrosia Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.  This piece exhibits decorative design in the wood as a result of the Ambrosia beetle.  Appropriately referred to as **Ambrosia Maple**, this wood is highly sought after for wood turning.',
  :woodtype_id    => 5
)

material2 = Material.create(
  :material_type  => 'Ambrosia Maple Burl',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.  This wood exhibits decorative design as a result of the Ambrosia beetle.  Appropriately referred to as **Ambrosia Maple**, this wood is highly sought after for wood turning.  This piece is prized most of all for its **Burl** wood, an explosion of cellular growth, yielding highly figured and unique patterning known for its beauty and rarity.',
  :woodtype_id    => 5
)

material3 = Material.create(
  :material_type  => 'American Black Walnut',
  :description    => 'This piece is made from **American Black Walnut**.  The Walnut is prized for its nuts and attractive hardwood.  Found throughout the world, it has long been recognized as a valued resource.  The Ancient Greeks symbolized it with fertility and strewn walnuts at weddings.  In contrast, Romans put one walnut with a bride\'s wedding dress for each year she wished to wait for children. The American Black Walnut grows throughout the Eastern and Central United States.  The wood is light to dark chocolate brown and with a rich patina that grows more luxurious with age.',
  :woodtype_id    => 11
)

material4 = Material.create(
  :material_type  => 'Box Elder',
  :description    => 'This urn is made of **Box Elder** wood.  Actually a Maple species, it got its name from the wood being similar to boxwood and the leaf to that of the elder.   The oldest flutes from the Americas were made of Box Elder.  Native Americans used it to make sugar for candies, charcoal for ceremonial painting, tubes for bellows and incense for spiritual medicines.  Usually a small, fast-growing and fairly short-lived tree, it grows from 30 to 80 feet tall.  Its natural range is from the Atlantic Coast to the Rocky Mountains.  Known for its red stain, it is prized for various decorative applications, such as turned items.',
  :woodtype_id    => 1
)

material5 = Material.create(
  :material_type  => 'Cherry',
  :description    => 'This urn comes from a piece of **Cherry** wood.  Like all fruit trees, the Cherry actually belongs to the rose family.  American Colonists used the cherry tree for its fruit, medicinal properties and home furnishings.  They mixed cherry juice with rum to create Cherry Bounce, a bitter but highly favored cordial.  Found in the Eastern United States, the average tree is 60 to 70 feet in height.   The heartwood of cherry varies from rich red to reddish brown and will darken with age and exposure to light.  In contrast the sapwood is creamy white.',
  :woodtype_id    => 4
)

material6 = Material.create(
  :material_type  => 'Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.',
  :woodtype_id    => 5
)

material7 = Material.create(
  :material_type  => 'Maple Burl',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.  This piece includes **Burl** wood, an explosion of cellular growth, which yields highly figured and unique patterning prized for its beauty and rarity.',
  :woodtype_id    => 5
)

material8 = Material.create(
  :material_type  => 'Pecan',
  :description    => 'This piece is made from **Pecan** wood.  A type of Hickory, the Pecan tree bears fruit.  Survived over 50 million years, it is one of America\'s first hardwoods.  The Pecan is valued for the nut as a food and the wood for it hardness and strength as well as its use for smoking meat.  It is the official state tree of Texas.  Its sapwood is yellow-brown and the heartwood is light to medium brown with a reddish hue.',
  :woodtype_id    => 7
)

material9 = Material.create(
  :material_type  => 'Southern Magnolia',
  :description    => 'This urn was turned from a piece of **Southern Magnolia**.  This tree is native to the Southeastern United States and is symbolic of the American South.  The flower was used as an emblem of the Confederate army in the US civil war.  It thrives throughout the Gulf and South Atlantic states, and has attractive shiny green leaves and fragrant flowers.  The Southern Magnolia is the state tree of Mississippi and the state flower of Mississippi and Louisiana.  The sapwood is yellowish-white with light to dark brown heartwood tinted yellow or green.',
  :woodtype_id    => 17
)

material10 = Material.create(
  :material_type  => 'Spalted Ambrosia Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.   This piece is **Spalted**, a natural breakdown that produces dark contrasting lines creating dramatic figuring with beautiful results.  In addition, this piece exhibits additional decorative design as a result of the Ambrosia beetle.  Appropriately referred to as **Ambrosia Maple**, this wood is highly sought after for wood turning.',
  :woodtype_id    => 5
)

material11 = Material.create(
  :material_type  => 'Spalted Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.  This piece is **Spalted**, a natural breakdown that produces dark contrasting lines creating dramatic figuring with beautiful results.',
  :woodtype_id    => 5
)

material12 = Material.create(
  :material_type  => 'Spalted Pecan',
  :description    => 'This piece is made from **Pecan** wood.  A type of Hickory, the Pecan tree bears fruit.  Survived over 50 million years, it is one of America\'s first hardwoods.  The Pecan is valued for the nut as a food and the wood for it hardness and strength as well as its use for smoking meat.  It is the official state tree of Texas.  Its sapwood is yellow-brown and the heartwood is light to medium brown with a reddish hue.  This piece is **Spalted**, a natural breakdown that produces dark contrasting lines creating dramatic figuring with beautiful results.',
  :woodtype_id    => 7
)

material13 = Material.create(
  :material_type  => 'Spalted American Sycamore',
  :description    => 'This piece is made from **American Sycamore**.  These trees grow to massive proportions, as tall as 130 feet, and are distinguished by its mottled exfoliating bark.  They thrive throughout the Eastern United States.  The wood is difficult to split and often used for furniture.  It has very distinct ray flecks and is sometimes called "Lacewood" because of its freckled appearance.  The sapwood is white to light tan and the heartwood is a darker reddish-brown.  This piece is **Spalted**, a natural breakdown that produces dark contrasting lines creating dramatic figuring with beautiful results.',
  :woodtype_id    => 10
)

material14 = Material.create(
  :material_type  => 'American Sycamore',
  :description    => 'This piece is made from **American Sycamore**.  These trees grow to massive proportions, as tall as 130 feet, and are distinguished by its mottled exfoliating bark.  They thrive throughout the Eastern United States.  The wood is difficult to split and often used for furniture.  It has very distinct ray flecks and is sometimes called "Lacewood" because of its freckled appearance.  The sapwood is white to light tan and the heartwood is a darker reddish-brown.',
  :woodtype_id    => 10
)

material15 = Material.create(
  :material_type  => 'Tulip Poplar',
  :description    => 'This urn is turned from **Tulip Poplar** wood.  The Poplar is taller than any other U.S. species reaching heights of 160 feet.  It grows abundantly throughout the Eastern United States and is commonly used for its qualities as a utility hardwood.  The bark, leaves, flowers, fruit and roots contain pharmaceuticals.  The sapwood is creamy white versus the contrast of the heartwood varying from yellowish-brown to olive green.',
  :woodtype_id    => 9
)

material16 = Material.create(
  :material_type  => 'American Black Walnut Burl',
  :description    => 'This piece is made from **American Black Walnut**.  The Walnut is prized for its nuts and attractive hardwood.  Found throughout the world, it has long been recognized as a valued resource.  The Ancient Greeks symbolized it with fertility and strewn walnuts at weddings.  In contrast, Romans put one walnut with a bride\'s wedding dress for each year she wished to wait for children. The American Black Walnut grows throughout the Eastern and Central United States.  The wood is light to dark chocolate brown and with a rich patina that grows more luxurious with age.  This piece includes **Burl** wood, an explosion of cellular growth, which yields highly figured and unique patterning prized for its beauty and rarity.',
  :woodtype_id    => 11
)

material17 = Material.create(
  :material_type  => 'Bradford Pear',
  :description    => 'This piece is made from the wood of a **Bradford Pear**, which is a cultivated variety of the Callery Pear.  Unlike most other pear trees this form is grown mainly for its ornamental features.  The showy, white flowers appear during spring growth, often before the leaves.   Pear wood has one of the finest textures of the fruitwoods. It is prized for making woodwind instruments, and is used in fine furniture.  It is the favored wood for architect\'s rulers because it does not warp.',
  :woodtype_id    => 18
)

material18 = Material.create(
  :material_type  => 'Camphor',
  :description    => 'This urn is made from **Camphor wood**.  The Camphor tree is native to Asia, but was brought into the United States and has naturalized in parts of the Southeast.  It is a large evergreen that will grow to 100 feet tall.  Camphor has a very characteristic odor, for which the tree is named.  It is recognizable from the extracts used in medicated chest rubs.  Wood color can be highly variable depending on growing conditions; generally a light brown with shades of red or olive green.',
  :woodtype_id    => 18
)

material19 = Material.create(
  :material_type  => 'Red Cedar',
  :description    => 'This piece is made from **Red Cedar** wood.  The Red Cedar is actually a species of the juniper native to Eastern North America.  It is a slow growing coniferous evergreen that can grow to 70 feet tall and live over 850 years.  The fragrant wood resists decay and insect attack making it popular for lining closets, making storage chests and used for fence posts that come in direct contact with the ground.  The heartwood is reddish to violet-brown with the sapwood almost yellow in color.',
  :woodtype_id    => 3
)

material20 = Material.create(
  :material_type  => 'Curly Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.   This piece has ripples in the grain pattern creating a three dimensional effect that appears as if the grain has "curled".  No one is sure why some wood has this **Curly** grain, but is prized for its finished effect.',
  :woodtype_id    => 5
)

material21 = Material.create(
  :material_type  => 'Eucalyptus',
  :description    => 'This piece comes from **Eucalyptus** wood.  Native to Australia, it is a diverse genus with over 700 species.  In the 1850s, Eucalyptus trees were introduced to California by Australians during the California Gold Rush.  Known as the fastest growing hardwood trees in the world, it is prized globally for excellence in paper and energy production.  The US Department of Energy sees the Eucalyptus as a major contributor to lessening our nation\'s dependence on foreign energy.  The heartwood darkens to a rich reddish-brown and the sapwood varies from gray to light brown.',
  :woodtype_id    => 18
)

material22 = Material.create(
  :material_type  => 'Southern Yellow Pine',
  :description    => 'This urn is made from **Southern Yellow Pine**.  This class of pine is considered a hard pine and is harder than white pine.  It grows throughout the Atlantic Coastal Plain, often in commercial stands, from Maryland through the Carolinas and Georgia into Florida, and westward to East Texas.  It is used extensively in home construction as framing lumber and plywood, and is also used in the construction of wooden roller coasters.  The wood color is a warm pale yellow with brown knots and the grain has a distinctive light and dark grain pattern.',
  :woodtype_id    => 8
)

material23 = Material.create(
  :material_type  => 'Spalted Maple Burl',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.  This piece is **Spalted**, a natural breakdown that produces dark contrasting lines creating dramatic figuring with beautiful results.  Prized most of all is the **Burl** in this wood, an explosion of cellular growth, yielding highly figured and unique patterning known for its beauty and rarity.',
  :woodtype_id    => 5
)

material24 = Material.create(
  :material_type  => 'American Beech',
  :description    => 'This urn is made from **American Beech**.  Related to the oak and chestnut, the American Beech is most common in higher altitudes of the Appalachian Mountain chain.  It grows to heights of 115 feet, and has the smoothest of all bark.  The wood is highly adaptable to steam bending and used for rocking chairs.  It is excellent for woodturning, and because the wood becomes slick with wear, is perfect for drawer sides and runners.  Wood color ranges from nearly white to deep red brown and the grain is identified by its dark pores in conspicuous rays.',
  :woodtype_id    => 18
)

material25 = Material.create(
  :material_type  => 'Blackjack Oak',
  :description    => 'This piece is turned from a piece of **Blackjack Oak**.  This oak species is a small tree generally with poor form and a crown of twisted limbs.  The bark cracks into rectangular black plates with narrow orange fissures.  It is native to Southern and Central United States.  Indians used the acorns for drink, and the Choctaw used blackjack oak as medication to aid in childbirth. The wood is very dense and functions as an excellent source of heat for barbeques and wood-burning stoves.',
  :woodtype_id    => 6
)

material26 = Material.create(
  :material_type  => 'Butternut',
  :description    => 'This piece was created from **Butternut** wood.  Butternut is sometimes called White Walnut, the other Walnut related to Black Walnut.  The fruit (nut) is more oval shaped, and the wood is considerably lighter in color than its cousin.  The Butternut is native to the northern Eastern United States.  Heartwood is usually medium tan sometimes with a reddish tint while the sapwood is a pale yellowish white.  The wood finishes well and is a favorite of wood carvers.',
  :woodtype_id    => 18
)

material27 = Material.create(
  :material_type  => 'Cherry Burl',
  :description    => 'This urn comes from a piece of **Cherry** wood.  Like all fruit trees, the Cherry actually belongs to the rose family.  American Colonists used the cherry tree for its fruit, medicinal properties and home furnishings.  They mixed cherry juice with rum to create Cherry Bounce, a bitter but highly favored cordial.  Found in the Eastern United States, the average tree is 60 to 70 feet in height.   The heartwood of cherry varies from rich red to reddish brown and will darken with age and exposure to light.  In contrast the sapwood is creamy white.  This piece includes Burl wood, an explosion of cellular growth, which yields highly figured and unique patterning prized for its beauty and rarity.',
  :woodtype_id    => 4
)

material28 = Material.create(
  :material_type  => 'Curly Camphor',
  :description    => 'This urn is made from **Camphor wood**.  The Camphor tree is native to Asia, but was brought into the United States and has naturalized in parts of the Southeast.  It is a large evergreen that will grow to 100 feet tall.  Camphor has a very characteristic odor, for which the tree is named.  It is recognizable from the extracts used in medicated chest rubs.  Wood color can be highly variable depending on growing conditions; generally a light brown with shades of red or olive green.   This piece has ripples in the grain pattern creating a three dimensional effect that appears as if the grain has "curled".  No one is sure why some wood has this **Curly** grain, but is prized for its finished effect.',
  :woodtype_id    => 18
)

material29 = Material.create(
  :material_type  => 'Curly Southern Magnolia',
  :description    => 'This urn was turned from a piece of **Southern Magnolia**.  This tree is native to the Southeastern United States and is symbolic of the American South.  The flower was used as an emblem of the Confederate army in the US civil war.  It thrives throughout the Gulf and South Atlantic states, and has attractive shiny green leaves and fragrant flowers.  The Southern Magnolia is the state tree of Mississippi and the state flower of Mississippi and Louisiana.  The sapwood is yellowish-white with light to dark brown heartwood tinted yellow or green.  This piece has ripples in the grain pattern creating a three dimensional effect that appears as if the grain has "curled".  No one is sure why some wood has this **Curly** grain, but is prized for its finished effect.',
  :woodtype_id    => 17
)

material30 = Material.create(
  :material_type  => 'Deodar Cedar',
  :description    => 'This piece was turned from **Deodar Cedar**.  This is a large coniferous evergreen, reaching heights of 195 feet, that is native to the western Himalayas.  Its name means "wood of the gods", and pure deodar forests are believed to be sacred places of worship.  It is widely grown as an ornamental tree in parks and large gardens throughout the Southeastern United States.  The wood is very durable and rot-resistant and has a history of being used to construct religious temples and the well-known houseboats of Kashmir.',
  :woodtype_id    => 3
)

material31 = Material.create(
  :material_type  => 'Northern Red Oak',
  :description    => 'This urn was made from the **Northern Red Oak**.  Native to North America from Georgia north to through Southeast Canada, it is the state tree of New Jersey and the provincial tree of Prince Edward Island.  Growing to 90 feet tall, it is easy to recognize by its bark, which features ridges with shiny stripes down the center.  The wood is reddish-brown and course grained.',
  :woodtype_id    => 6
)

material32 = Material.create(
  :material_type  => 'Northern Red Oak Burl',
  :description    => 'This urn was made from the **Northern Red Oak**.  Native to North America from Georgia north to through Southeast Canada, it is the state tree of New Jersey and the provincial tree of Prince Edward Island.  Growing to 90 feet tall, it is easy to recognize by its bark, which features ridges with shiny stripes down the center.  The wood is reddish-brown and course grained.  This piece includes Burl wood, an explosion of cellular growth, which yields highly figured and unique patterning prized for its beauty and rarity.',
  :woodtype_id    => 6
)

material33 = Material.create(
  :material_type  => 'Spalted American Beech',
  :description    => 'This urn is made from **American Beech**.  Related to the oak and chestnut, the American Beech is most common in higher altitudes of the Appalachian Mountain chain.  It grows to heights of 115 feet, and has the smoothest of all bark.  The wood is highly adaptable to steam bending and used for rocking chairs.  It is excellent for woodturning, and because the wood becomes slick with wear, is perfect for drawer sides and runners.  Wood color ranges from nearly white to deep red brown and the grain is identified by its dark pores in conspicuous rays.  This piece is **Spalted**, a natural breakdown that produces dark contrasting lines creating dramatic figuring with beautiful results.',
  :woodtype_id    => 18
)

material34 = Material.create(
  :material_type  => 'Bird\'s Eye Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.  This Maple contains figuring resembling small birds eyes, and is thus referred to as Bird\'s Eye Maple.  It results from clusters of budding stunted by low light conditions, and is a relatively rare and prized wood.',
  :woodtype_id    => 5
)

material35 = Material.create(
  :material_type  => 'Vermont Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.',
  :woodtype_id    => 5
)

material36 = Material.create(
  :material_type  => 'Silver Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.',
  :woodtype_id    => 5
)

material37 = Material.create(
  :material_type  => 'Quilted Maple',
  :description    => 'This urn is made from **Maple** wood, an American favorite.  Best known for syrup and displays of red, orange and yellow each fall, Maples grow throughout the Eastern and Central United States.  Trees can reach 130 feet tall and the wood color varies from creamy white to grey to reddish-brown depending on the species.',
  :woodtype_id    => 5
)

material38 = Material.create(
  :material_type  => 'Sweet Gum',
  :description    => ' ',
  :woodtype_id    => 18
)

material39 = Material.create(
  :material_type  => 'Birch',
  :description    => ' ',
  :woodtype_id    => 18
)

material40 = Material.create(
  :material_type  => 'Dogwood',
  :description    => ' ',
  :woodtype_id    => 18
)

material41 = Material.create(
  :material_type  => 'Hickory',
  :description    => ' ',
  :woodtype_id    => 18
)

material42 = Material.create(
  :material_type  => 'Mahogany',
  :description    => ' ',
  :woodtype_id    => 18
)

material43 = Material.create(
  :material_type  => 'Mulberry',
  :description    => ' ',
  :woodtype_id    => 18
)

material44 = Material.create(
  :material_type  => 'Rainbow Poplar',
  :description    => ' ',
  :woodtype_id    => 9
)

material45 = Material.create(
  :material_type  => 'Redbud',
  :description    => ' ',
  :woodtype_id    => 18
)

material46 = Material.create(
  :material_type  => 'Yellow Birch',
  :description    => ' ',
  :woodtype_id    => 18
)






chunk0 = Origin.create(
  :chunk          => '000',
  :description    => 'This is an unknown chunk.'
)

chunk1 = Origin.create(
  :chunk          => '123',
  :description    => 'This Cedar tree was found floating in the river after a storm hit my house.'
)

chunk2 = Origin.create(
  :chunk          => '234',
  :description    => 'Parts of a Sycamore tree.'
)

chunk3 = Origin.create(
  :chunk          => '345',
  :description    => 'Parts of a Smore tree.'
)





style1 = Productstyle.create(
  :product_style  => 'Artisan Series Classic Design',
  :description    => 'This piece is part of Artistic Urns **Artisan Series**.  Handcrafted with the skill and methods used by centuries of wood turners, this is the Classic design.  Born from a solid piece of wood and made with care and passion.  Secured with a threaded top, this urn has been cut, turned and finished by hand in our studio nestled in the foothills of the southern Appalachians.

In an age of automation and mass production, the Artisan Series stands out as a one-at-a-time, one-of-a-kind product.'
)

style2 = Productstyle.create(
  :product_style  => 'Artisan Series Craftsman Design',
  :description    => 'This piece is part of Artistic Urns **Artisan Series**.  Handcrafted with the skill and methods used by centuries of wood turners, this is the Craftsman design.  Born from a solid piece of wood and made with care and passion.  Secured with a threaded top, this urn has been cut, turned and finished by hand in our studio nestled in the foothills of the southern Appalachians.

In an age of automation and mass production, the Artisan Series stands out as a one-at-a-time, one-of-a-kind product.'
)

style3 = Productstyle.create(
  :product_style  => 'Artisan Series Heritage Design',
  :description    => 'This piece is part of Artistic Urns **Artisan Series**.  Handcrafted with the skill and methods used by centuries of wood turners, this is the Heritage design.  Born from a solid piece of wood and made with care and passion.  Secured with a threaded top, this urn has been cut, turned and finished by hand in our studio nestled in the foothills of the southern Appalachians.

In an age of automation and mass production, the Artisan Series stands out as a one-at-a-time, one-of-a-kind product.'
)

style4 = Productstyle.create(
  :product_style  => 'Collector\'s Edition',
  :description    => 'This is a **Collector\'s Edition** urn.  Born from a single piece of wood, this started as a 40 pound block of green wood and has been transformed into a 2 pound Work of Art.   This piece has the exact same design and build process as Artistic Urns original Signature Series -  the only difference is there is more "Wow!" in the wood character.

The Collector\'s Edition features all of Artistic Urns trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

This piece also includes Artistic Urns exclusive RELIQUARY keepsake chamber.

The Collector\'s Edition for **When Ordinary Just Won\'t Do!**'
)

style5 = Productstyle.create(
  :product_style  => 'Collector\'s Edition Keepsake',
  :description    => 'This is a **Collector\'s Edition** keepsake urn.  Born from a single piece of wood, this started as a block of green wood and has been transformed into a Work of Art.   This piece has the exact same design and build process as Artistic Urns original Signature Series - the only difference is there is more "Wow!" in the wood character.

A keepsake urn is any piece that measures **less than full size** in terms of internal capacity.  Popular if the wishes are to scatter a portion and keep the rest, or when dividing the remains among different family members.  Many families obtain a keepsake as a memorial for the home to remember their loved one after the remains have been interred or scattered.

The Collector\'s Edition features all of Artistic Urns trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

The Collector\'s Edition for **When Ordinary Just Won\'t Do!**'
)

style6 = Productstyle.create(
  :product_style  => 'Signature Series',
  :description    => 'This piece is a **Signature Series**, Artistic Urns\' original urn.  Born from a single piece of wood, this started as a 40 pound block of green wood and has been transformed into a 2 pound Work of Art.

The Signature Series features all of Artistic Urns "signature" trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

This piece also includes Artistic Urns exclusive RELIQUARY keepsake chamber.

The original Signature Series, for **When Ordinary Just Won\'t Do!**'
)

style7 = Productstyle.create(
  :product_style  => 'Signature Series Keepsake',
  :description    => 'This piece is a **Signature Series**, Artistic Urns\' original urn.  Born from a single piece of green wood, it has been transformed into a Work of Art.   Every urn is a UNIQUE, One-Of-A-Kind piece.  No two are alike  -  the shape, size and wood character will always differ.

A keepsake urn is any piece that measures **less than full size** in terms of internal capacity.  Popular if the wishes are to scatter a portion and keep the rest, or when dividing the remains among different family members.  Many families obtain a keepsake as a memorial for the home to remember their loved one after the remains have been interred or scattered.

The Signature Series features all of Artistic Urns "signature" trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

The original Signature Series, for **When Ordinary Just Won\'t Do!**'
)

style8 = Productstyle.create(
  :product_style  => 'Visual Embrace',
  :description    => 'Artistic Urns has categorized this piece as a **Visual Embrace**.  This urn is designed for today\'s columbarium glass niches.  Dimensionally correct and visually striking, this piece will scream "Wow!" right through the glass.

The Visual Embrace features all of Artistic Urns trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

The Visual Embrace, for **When Ordinary Just Won\'t Do!**'
)

style9 = Productstyle.create(
  :product_style  => 'Fine Art',
  :description    => 'This urn is truly one off and is an Artistic Urns **Fine Art** piece.   Pushing the imagination, this work of art might be discovered from a local art gallery.  For the most discriminating tastes, this will brighten the decor and be the conversation in any surrounding.  This is **The Urn That Does Not Look Like An Urn**.

The Visual Embrace features all of Artistic Urns trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

The Fine Art line from Artistic Urns, for **When Ordinary Just Won\'t Do!**'
)

style10 = Productstyle.create(
  :product_style  => 'Fine Art Keepsake',
  :description    => 'This urn is truly one off and is an Artistic Urns **Fine Art** piece.   Pushing the imagination, this work of art might be discovered from a local art gallery.  For the most discriminating tastes, this will brighten the decor and be the conversation in any surrounding.  This is **The Urn That Does Not Look Like An Urn**.

A keepsake urn is any piece that measures **less than full size** in terms of internal capacity.  Popular if the wishes are to scatter a portion and keep the rest, or when dividing the remains among different family members.  Many families obtain a keepsake as a memorial for the home to remember their loved one after the remains have been interred or scattered.

The Visual Embrace features all of Artistic Urns trademarks

- 100% MADE IN AMERICA
- HANDMADE
- SIGNED by the Artist
- Assigned a SERIAL NUMBER
- Secured with a THREADED TOP.

The Fine Art line from Artistic Urns, for **When Ordinary Just Won\'t Do!**'
)

style11 = Productstyle.create(
  :product_style  => 'Accessories',
  :description    => '**Accessories** and **Customize** your urn stuff goes here.'
)

#
#
# fade1 = Fader.create(
#   :header       => "Acorn",
#   :description  => "This is an acorn made of wood."
# )
#
# fade2 = Fader.create(
#   :header       => "Accessory",
#   :description  => "This is an accessory made of wood and a rusty brass name plate."
# )


#
#
#
# second = Product.create(
#  :serial_number => '9000',
#  :manufacturer  => 'Bob\'s Urns',
#  :sku           => '111149911',
#  :artist        => 'Bob',
#  :statement     => 'Made in America.',
#  :height        => '12.5',
#  :width         => '12',
#  :depth         => '12',
#  :top           => '',
#  :capacity      => '485',
#  :price         => '3600',
#  :quantity      => '1',
#  :material2     => '',
#  :material3     => 'Maple Burl',
#  :material4     => 'Oak',
#  :notes         => 'Made in Georgia.',
#  :material_id   => 1,
#  :productstyle_id  => 1,
#  :origin_id      => 1
# )
#
# third = Product.create(
#   :serial_number => '9001',
#   :manufacturer  => 'Mary\'s Urns',
#   :sku           => '111149911',
#   :artist        => 'Mary',
#   :statement     => 'Made in America.',
#   :height        => '7',
#   :width         => '7',
#   :depth         => '7',
#   :top           => '',
#   :capacity      => '87',
#   :price         => '922',
#   :quantity      => '1',
#   :material2     => '',
#   :material3     => 'Box Elder',
#   :material4     => 'Oak',
#   :wood_color1   => '',
#   :wood_color2   => '',
#   :notes         => 'Made in Georgia.',
#   :material_id   => 1,
#   :productstyle_id  => 1,
#   :origin_id      => 1
#
#  )
#
# forth = Product.create(
#   :serial_number => '9002',
#   :manufacturer  => 'Martian Urns',
#   :sku           => '4343',
#   :artist        => 'Clark',
#   :statement     => 'Made in America.',
#   :height        => '4.75',
#   :width         => '5',
#   :depth         => '5',
#   :top           => '',
#   :capacity      => '50',
#   :price         => '480',
#   :quantity      => '1',
#   :material2     => '',
#   :material3     => 'Box Elder',
#   :material4     => 'Oak',
#   :wood_color1   => '',
#   :wood_color2   => '',
#   :notes         => 'Made in Georgia.',
#   :material_id   => 1,
#   :productstyle_id  => 1,
#   :origin_id      => 1
#
# )
#
# fifth = Product.create(
#   :serial_number => '9003',
#   :manufacturer  => 'Seth\'s Urns',
#   :sku           => '354657',
#   :artist        => 'Bob',
#   :statement     => 'Made in America.',
#   :height        => '12.5',
#   :width         => '12',
#   :depth         => '12',
#   :top           => '',
#   :capacity      => '485',
#   :price         => '3600',
#   :quantity      => '1',
#   :material2     => '',
#   :material3     => 'Maple Burl',
#   :material4     => 'Oak',
#   :wood_color1   => '',
#   :wood_color2   => '',
#   :notes         => 'Made in Georgia.',
#   :material_id   => 1,
#   :productstyle_id  => 1,
#   :origin_id      => 1
#
# )
#
# barnie = Product.create(
#   :serial_number    => '9004',
#   :manufacturer     => 'Barnie\'s Urns',
#   :sku              => 'adbie87',
#   :artist           => 'Mary',
#   :statement        => 'Made in America.',
#   :height           => '7',
#   :width            => '7',
#   :depth            => '7',
#   :top              => '',
#   :capacity         => '87',
#   :price            => '922',
#   :quantity         => '1',
#   :material2        => 'Big',
#   :material3        => 'Box Elder',
#   :material4        => 'Oak',
#   :wood_color1      => 'Red',
#   :wood_color2      => 'Pink',
#   :notes            => 'Made in Georgia.',
#   :material_id   => 1,
#   :productstyle_id  => 1,
#   :origin_id      => 1
#
# )


#
#
#  dominic = Distributor.create(
#   :name           => 'Cremation Society of Alaska',
#   :type           => 'Funeral Home',
#   :subdomain      => '',
#   :site           => 'homewww.alaskacremation.com',
#   :phone          => '907-277-2777',
#   :phone2         => '777-777-7777',
#   :mobile         => '888-888-8888',
#   :addr1          => '7216 Lake Otis Parkway',
#   :addr2          => 'Suite 682',
#   :city           => 'Anchorage',
#   :state          => 'AK',
#   :zip            => '99507',
#   :country        => 'USA',
#   :notes          => '10/25/11: Met Dominic at NFDA 2011 Expo [ac].
# 11/15/11: Sent Dominic landing page [ac].
# 12/09/11: Dominic called & ordered 10 acorns [ac].',
#   :discount_code  => 'BOB',
#   :discount_rate  => '6',
#   :contact        => 'Dominic Hasara',
#   :contact_title  => 'Owner',
#   :species        => 'Human',
#   :facility       => 'Elba',
#   :email          =>  'alaskacremation@gmail.com'
# )
#
# jones = Distributor.create(
#   :name           => 'Kirk & Nice Suburban Chapel At Sunset Memorial Park',
#   :type           => 'Cemetery',
#   :subdomain      => 'alice',
#   :site           => 'kirkandnicesuburban.com',
#   :phone          => '215-354-0085',
#   :phone2         => '',
#   :mobile         => '444 444 4444',
#   :addr1          => '333 County Line Road',
#   :addr2          => 'Suite 682',
#   :city           => 'Feasterville',
#   :state          => 'PA',
#   :zip            => '19053',
#   :country        => 'US',
#   :notes          => 'Stewart Services',
#   :discount_code  => 'ALICE',
#   :discount_rate  => '22',
#   :contact        => 'Alice',
#   :contact_title  => 'President',
#   :species        => 'Human',
#   :facility       => '38311',
#   :email          => 'alice@jones.bob'
# )
#
