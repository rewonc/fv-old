Farmivore.Farm = DS.Model.extend
  name: DS.attr "string"
  farmerName: DS.attr "string"
  description: DS.attr "string"

  methodology: DS.attr "string"
  address: DS.attr "string"

  place: DS.belongsTo 'place'
  listingItems: DS.hasMany("listing_item") #, async: true, inverse: 'farm')
  mixPanelProps: ->
    name: @get('name')
    id: @get('id')
    methodology: @get('methodology')


farm1 =
  id: 1
  name: "Colton's Corner"
  farmerName: "Jim"
  description: "Colton's Corner has been a family tradition since 1974. The farm is very old, and as such brings with it a connection to another time. The farm has tried to capture that connection by offering country fresh fruit and produce from its family to yours. They look forward to seeing you."
  listingItems: []
farm2 =
  id: 2
  name: "Starlight Gardens"
  farmerName: ""
  description: "Starlight Gardens in Durham, CT organic certified. Starlight Gardens is run by Ty and David Zemelsky."
  listingItems: []
farm3 =
  id: 3
  name: "Sugar Maple Farms"
  farmerName: ""
  address: "779 Exeter Road, Lebanon, CT 06249"
  description: "Sugar Maple Farms has been making maple syrup in Connecticut for over 20 years."
  listingItems: []

farm4 =
  id: 4
  name: "Blue Slope"
  farmerName: ""
  address: "138 Blue Hill Road, Franklin, CT 06254"
  description: "Four generations of agricultural tradition in rural Connecticut."
  listingItems: []

farm5 =
  id: 5
  name: "Waldingfield Farm"
  farmerName: ""
  address: "24 East Street, Washington, CT 06793"
  description: "Waldingfield Farm is a certified organic vegetable farm located in the heart of Litchfield County, CT.  We specialize in heirloom tomatoes and other specialty vegetables. We have a CSA program and attend seasonal farmer's markets in New Haven (Wednesday & Saturday), Weston (Sat), Kent (Sat), and Sandy Hook (Tuesday). All are in CT."
  url: "http://www.waldingfieldfarm.com"
  listingItems: []

farm6 =
  id: 6
  name: "Stone Gardens Farm"
  farmerName: ""
  address: "83 Saw Mill City Road in Shelton, Connecticut"
  description: "Fred and Stacia Monahan founded Stone Gardens Farm in 1998, after expanding from a roadside vegetable stand where they sold vegetables and flowers at Shelton’s Dairy on Birdseye Road in Shelton. The couple steadily grew their business, planting more varieties of vegetables on mostly leased land."
  url: "http://www.stonegardensfarm.com"
  listingItems: []

farm7 =
  id: 7
  name: "True Love Farms"
  farmerName: "122 Thomaston Rd, Morris, CT 06763"
  address: ""
  description: "The pork at True Love Farms comes from heritage-hybrid pigs born and raised on the farm. Their Tamworth boars and Berkshire-cross sows produce muscular, hearty hogs who do well outdoors. They also produce lean and flavorful beef fed only on grasses and legumes from their fields.  They apply no pesticides, herbicides, or chemical fertilizers to their pastures, and their cattle are completely hormone and antibiotic free."
  url: "http://www.truelovefarms.org"
  listingItems: []

farm8 =
  id: 8
  name: "Northfordy"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm9 =
  id: 9
  name: "Beltane Farms"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm10 =
  id: 10
  name: "Chaplin Farms"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm11 =
  id: 11
  name: "Hall's Farm"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm12 =
  id: 12
  name: "Barberry Hill"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm13 =
  id: 13
  name: "Sun One Organics"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm14 =
  id: 14
  name: "Four Mile River Farm"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm15 =
  id: 15
  name: "Dolan Brothers"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm16 =
  id: 16
  name: "Mystic Cheese"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm17 =
  id: 17
  name: "Four Mile River Farm"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm18 =
  id: 18
  name: "Sankow's Beaver Brook"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm19 =
  id: 19
  name: "Smyth's Trinity"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm20 =
  id: 20
  name: "SoNo Baking Company"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm21 =
  id: 21
  name: "Whole German Bread"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm22 =
  id: 22
  name: "Sticky Nuts"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm23 =
  id: 23
  name: "The Soup Girl"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm24 =
  id: 24
  name: "Best Buddy Biscuits"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []

farm25 =
  id: 25
  name: "Garden Fresh Baby"
  farmerName: ""
  address: "53 Lanes Pond Road. Northford, Connecticut 06472"
  description:  "For over 35 years, we’ve been growing vegetables, flowers and herbs on our small family farm in Northford using sustainable and pesticide-free methods. We are Certified Naturally Grown, use nutrient dense growing practices and are also members of the CT Chapter of the Northeast Organic Farming Association (NOFA) and sign their Farmers’ Pledge."
  listingItems: []



Farmivore.Farm.FIXTURES = [farm1, farm2, farm3, farm4, farm5, farm6, farm7, farm8, farm9, farm10, farm11, farm12, farm13, farm14, farm15, farm16, farm17, farm18, farm19, farm20, farm21, farm22, farm23, farm24, farm25]
