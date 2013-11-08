Farmivore.Place = DS.Model.extend
  title: ""
  state: ""
  farms: null

Farmivore.ListingItem = Ember.Object.extend
  category: ""
  description: ""
  price: ""
  priceUnit: ""
  farm: null

Farmivore.Farm = DS.Model.extend
  name: DS.attr "string"
  farmerName: DS.attr "string"
  description: DS.attr "string"

  methodology: DS.attr "string"
  address: DS.attr "string"
  # listings: DS

farm1 =
  id: 1
  name: "Colton's Corner"
  farmerName: "Jim"
  description: "Colton's Corner has been a family tradition since 1974. The farm is very old, and as such brings with it a connection to another time. The farm has tried to capture that connection by offering country fresh fruit and produce from its family to yours. They look forward to seeing you."
farm2 =
  id: 2
  name: "Starlight Gardens"
  farmerName: ""
  description: "Starlight Gardens in Durham, CT organic certified. Starlight Gardens is run by Ty and David Zemelsky."
farm3 =
  id: 3
  name: "Sugar Maple Farms"
  farmerName: ""
  address: "779 Exeter Road, Lebanon, CT 06249"
  description: "Sugar Maple Farms has been making maple syrup in Connecticut for over 20 years."

farm4 =
  id: 4
  name: "Blue Slope"
  farmerName: ""
  address: "138 Blue Hill Road, Franklin, CT 06254"
  description: "Four generations of agricultural tradition in rural Connecticut."

farm5 =
  id: 5
  name: "Waldingfield Farm"
  farmerName: ""
  address: "24 East Street, Washington, CT 06793"
  description: "Waldingfield Farm is a certified organic vegetable farm located in the heart of Litchfield County, CT.  We specialize in heirloom tomatoes and other specialty vegetables. We have a CSA program and attend seasonal farmer's markets in New Haven (Wednesday & Saturday), Weston (Sat), Kent (Sat), and Sandy Hook (Tuesday). All are in CT."
  url: "http://www.waldingfieldfarm.com"

farm6 =
  id: 6
  name: "Stone Gardens Farm"
  farmerName: "83 Saw Mill City Road in Shelton, Connecticut"
  address: ""
  description: "Fred and Stacia Monahan founded Stone Gardens Farm in 1998, after expanding from a roadside vegetable stand where they sold vegetables and flowers at Shelton’s Dairy on Birdseye Road in Shelton. The couple steadily grew their business, planting more varieties of vegetables on mostly leased land."
  url: "http://www.stonegardensfarm.com"

farm7 =
  id: 7
  name: "True Love Farms"
  farmerName: "122 Thomaston Rd, Morris, CT 06763"
  address: ""
  description: "The pork at True Love Farms comes from heritage-hybrid pigs born and raised on the farm. Their Tamworth boars and Berkshire-cross sows produce muscular, hearty hogs who do well outdoors. They also produce lean and flavorful beef fed only on grasses and legumes from their fields.  They apply no pesticides, herbicides, or chemical fertilizers to their pastures, and their cattle are completely hormone and antibiotic free."
  url: "http://www.truelovefarms.org"

Farmivore.Farm.FIXTURES = [farm1, farm2, farm3, farm4, farm5, farm6, farm7]



