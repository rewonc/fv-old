Farmivore.ListingItem = DS.Model.extend
  category: DS.attr 'string'
  description: DS.attr 'string'
  tag: DS.attr 'string'
  price: DS.attr()
  priceUnit: DS.attr 'string'
  farm: DS.belongsTo("farm") #, async: true, inverse: 'listingItems')
  priceString: (->
    if @get('price')? && @get('priceUnit')
      "$#{@get('price')}/#{@get('priceUnit')}"
    else if !isNaN @get('price')
      "$#{@get('price')}"
    else
      @get('price')
  ).property('price', 'priceUnit')

  sortKey: (->
    "#{@get('priceUnit')}-#{@get('price')}"
  ).property('price', 'priceUnit')

  soldOut: (->
    @get('priceString') == "SOLDOUT"
  ).property 'priceString'


window.src = [
  ["Colton's Corner", "Jim", "Gala Apples", "Apples","Fruits", "$2/lb",""]
  ["Colton's Corner", "Jim", "Macoun Apples", "Apples","Fruits", "$2.50/lb",""]
  ["Colton's Corner", "Jim", "Northern Spy Apples (for cooking)", "Apples","Fruits", "$2/lb",""]
  ["Colton's Corner", "Jim", "Empire Apples", "Apples","Fruits", "$2/lb",""]
  ["Colton's Corner", "Jim", "Red Delicious Apples", "Apples","Fruits", "$2/lb",""]
  ["Colton's Corner", "Jim", "MacIntosh Apples", "Apples","Fruits", "$2/lb",""]
  ["Colton's Corner", "Jim", "Second pickings", "Apples","Fruits", "$1.50/lb",""]
  ["Sugar Maple Farms", "Jim & Chuck", "Maple Syrup - Quart", "Maple Syrup","Products", "$23",""]
  ["Sugar Maple Farms", "Jim & Chuck", "Maple Syrup - Pint", "Maple Syrup","Products", "$13",""]
  ["Sugar Maple Farms", "Jim & Chuck", "Maple Syrup - Half-pint", "Maple Syrup","Products", "$7",""]
  ["Sugar Maple Farms", "Jim & Chuck", "Honey bear", "Honey","Products", "$8",""]
  ["Sugar Maple Farms", "Jim & Chuck", "5 lb honey bucket", "Honey","Products", "$34",""]
  ["Sugar Maple Farms", "Jim & Chuck", "Peanut Brittle", "Candy","Products", "$7",""]
  ["Sugar Maple Farms", "Jim & Chuck", "Horseradish", "Sauces","Products", "$5",""]
  ["Blue Slope", "Matt", "Veal Bacon", "Veal","Meat", "$17/lb","Free range"]
  ["Blue Slope", "Matt", "Beef Bacon", "Beef","Meat", "$12/lb","Free range"]
  ["Blue Slope", "Matt", "Kielbasa", "Sausage","Meat", "$17/lb","Free range"]
  ["Blue Slope", "Matt", "Ornamental Corn - large bunch", "Corn","Vegetables", "$4/lg, $2.75/small bunch",""]
  ["Blue Slope", "Matt", "Maple Syrup - Quart", "Maple Syrup","Products", "$24",""]
  ["Blue Slope", "Matt", "Maple Syrup - Pint", "Maple Syrup","Products", "$13",""]
  ["Blue Slope", "Matt", "Veal - Cutlets", "Veal","Meat", "$11.50/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Flank", "Veal","Meat", "$11/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Tenderloin", "Veal","Meat", "$11/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Ribs", "Veal","Meat", "$10.25/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Shoulder", "Veal","Meat", "$10.25/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Roast", "Veal","Meat", "$8/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Sausage", "Veal","Meat", "$7.25/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Stew Meat", "Veal","Meat", "$7.25/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Bratwurst", "Veal","Meat", "$11/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Pepperoni", "Veal","Meat", "$10/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Ground", "Veal","Meat", "$6.75/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Liver", "Veal","Meat", "$6.50/lb","Free range"]
  ["Blue Slope", "Matt", "Veal - Hearts & Kidneys", "Veal","Meat", "$6/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Organs", "Beef","Meat", "$3/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Jerkey", "Beef","Meat", "$9.25/pack","Free range"]
  ["Blue Slope", "Matt", "Beef - Summer Sausage", "Beef","Meat", "$9/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Hamburger", "Beef","Meat", "$6.50/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Sausage", "Beef","Meat", "$6.50/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Chuck Roast", "Beef","Meat", "$6.50/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Stew Meat", "Beef","Meat", "$6.50/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Tenderloin", "Beef","Meat", "$18/lb","Free range"]
  ["Blue Slope", "Matt", "Beef - Sirloin", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Beef - Eye of Round Roast", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Beef - London Broil Roast", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Beef - Flank Steak", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Beef - Short Ribs", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Beef - Knuckle Steak", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Beef - Strip Steak", "Beef","Meat", "SOLDOUT","Free range"]
  ["Blue Slope", "Matt", "Goat - Loin Chop", "Goat","Meat", "$15/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Rib Chop", "Goat","Meat", "$14/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Shoulder Chop", "Goat","Meat", "$13/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Leg Roasts", "Goat","Meat", "$12.50/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Stew Meat", "Goat","Meat", "$13/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Sausage", "Goat","Meat", "$11.25/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Ground", "Goat","Meat", "$11.25/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Liver, Kidney, Heart", "Goat","Meat", "$6/lb","Free range"]
  ["Blue Slope", "Matt", "Goat - Bones", "Goat","Meat", "SOLDOUT","Free range"]
  ["Waldingfield Farm", "Patrick", "No Spray Apples", "Apples","Fruits", "$3/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Winter Squash", "Squash","Vegetables", "$2/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Fingerling Potatoes", "Potatoes","Vegetables", "$4.50/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Beets", "Beets","Vegetables", "$3/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Sun Gold Tomato Jam", "Jams","Products", "$6/jar",""]
  ["Waldingfield Farm", "Patrick", "Heirloom Tomato Chutney", "Sauces","Products", "$6/jar",""]
  ["Waldingfield Farm", "Patrick", "The Farmer's Maple Syrup", "Maple Syrup","Products", "$12/bottle",""]
  ["Waldingfield Farm", "Patrick", "Kale bunches", "Greens","Vegetables", "$6/ 3 bunches","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Swiss Chard", "Greens","Vegetables", "$3/bunch","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Baby Bok Choy", "Greens","Vegetables", "$3/bunch","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Broccoli", "Broccoli","Vegetables", "$4/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Mustard Greens", "Greens","Vegetables", "$3.5/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Amazin' Asian Salad Mix", "Greens","Vegetables", "$3 per 1/4 lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "'Killa' Arugula", "Greens","Vegetables", "$3.25/lb","Certified organic"]
  ["Waldingfield Farm", "Patrick", "Crushed Heirloom Tomatoes", "Sauces","Products", "$8/jar",""]
  ["Waldingfield Farm", "Patrick", "The Farmer's Heirloom Tomato and Basil Sauce", "Sauces","Products", "$6/jar",""]
  ["Waldingfield Farm", "Patrick", "The Farmer's Bloody Mary Mix", "Sauces","Products", "$10/jar",""]
  ["Stone Gardens Farm", "Stacia", "Garlic", "Garlic","Vegetables", "$10/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Brussel Sprouts", "Brussel Sprouts","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Sweet Potatoes", "Potatoes","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Winter Squash", "Squash","Vegetables", "$1/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Tomatoes", "Tomatoes","Vegetables", "$2/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Sweet Peppers", "Peppers","Vegetables", "$2/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Large Eggplant", "Eggplant","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Cauliflower", "Cauliflower","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Colorful Cauliflower", "Cauliflower","Vegetables", "$2/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Broccoli", "Broccoli","Vegetables", "$3/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Rosemary", "Herbs","Vegetables", "$4/bunch","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Dill", "Herbs","Vegetables", "$3/bunch","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Parsley", "Herbs","Vegetables", "$3/bunch","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Asian Salad Mix", "Greens","Vegetables", "$8/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Escarole", "Greens","Vegetables", "$4/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Bok Choy", "Greens","Vegetables", "$4/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Hot Peppers", "Peppers","Vegetables", "$3/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Kohlrabi", "Kohlrabi","Vegetables", "$2/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Lettuce", "Greens","Vegetables", "$4/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Broccoli Rabe", "Greens","Vegetables", "$4/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Leeks", "Leeks","Vegetables", "$4/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Turnips", "Root vegetables","Vegetables", "$2/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Dandelion Greens", "Greens","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Swiss Chard", "Greens","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Radishes", "Root vegetables","Vegetables", "$1.50/bunch","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Carrots", "Root vegetables","Vegetables", "$1.50/bunch","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Fennel", "Herbs","Vegetables", "$3/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Kale - Tuscan", "Greens","Vegetables", "$1.50/bunch","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Kale - Curly Winterbor", "Greens","Vegetables", "$1.50/lb","Integrated pest management"]
  ["Stone Gardens Farm", "Stacia", "Collard Greens", "Greens","Vegetables", "$1.50/bunch","Integrated pest management"]
  ["True Love Farms", "Tom", "Pork - Loin Chops (Good for grilling!)", "Pork","Meat", "$10.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Blade Steaks", "Pork","Meat", "$9.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Spareribs", "Pork","Meat", "$9/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Fresh Ham Steak", "Pork","Meat", "$8.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Loin Roast", "Pork","Meat", "$10.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Shoulder Roast", "Pork","Meat", "$9.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Fresh Ham Roast", "Pork","Meat", "$8.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Shank", "Pork","Meat", "$6.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Sausage (Hot, Sweet, Breakfast)", "Pork","Meat", "$8.50/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Ground", "Pork","Meat", "$8/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Bacon", "Pork","Meat", "$12/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Pigs Feet", "Pork","Meat", "$3/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Pork - Leaf Lard", "Pork","Meat", "$3/lb","Pasture raised"]
  ["True Love Farms", "Tom", "Chicken - Pasture Raised", "Chicken","Meat", "$5.50/lb","Pasture raised"]
  ["Northfordy", "Peter & Judith", "Peppers", "Peppers","Vegetables", "$6/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Carrots", "Carrots","Vegetables", "$5/bunch","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Radishes - Cherriette", "Root vegetables","Vegetables", "$3/bunch","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Radishes - Fresh Breakfast", "Root vegetables","Vegetables", "$3/bunch","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Broccoli Rabe", "Root vegetables","Vegetables", "$3/bunch","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Swiss Chard", "Greens","Vegetables", "$3.50/bunch","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Heirloom Tomatoes", "Tomatoes","Vegetables", "$5/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Kale - Red Russian & Lacinato", "Greens","Vegetables", "$3/bunch","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Spinach", "Greens","Vegetables", "$4/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Beets", "Root vegetables","Vegetables", "$4/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Beet Greens", "Greens","Vegetables", "$3/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Turnips - Scarlet Queen & Harurei", "Root vegetables","Vegetables", "$3/box","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Green Tomatoes", "Tomatoes","Vegetables", "$2.50/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Fresh Horseradish", "Spice","Vegetables", "$10/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Dried Habanero Peppers", "Peppers","Products", "$3/bag","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Very Hot Peppers", "Peppers","Vegetables", "$3/box","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Baby Ginger", "Spice", "Vegetables", "$14/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Paw Paw", "Paw Paw","Fruits", "$12/lb","Certified naturally grown"]
  ["Northfordy", "Peter & Judith", "Maple Syrup - Half-gallon", "Maple Syrup","Products", "$43",""]
  ["Northfordy", "Peter & Judith", "Maple Syrup - Quart", "Maple Syrup","Products", "$23",""]
  ["Northfordy", "Peter & Judith", "Maple Syrup - Pint", "Maple Syrup","Products", "$13",""]
  ["Northfordy", "Peter & Judith", "Maple Syrup - Half-pint", "Maple Syrup","Products", "$7",""]
  ]

###
["Beltane Farms", "Paul", "Chevre - Plain", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Chevre - Dill", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Chevre - Chive", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Chevre - Herbs", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Chevre - Wasabi Chive", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Chevre - Harvest Special", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Chevre - Pumpkin Special", "Chevre","Dairy", "$8",""]
["Beltane Farms", "Paul", "Yogurt", "Yogurt","Dairy", "$3",""]
["Beltane Farms", "Paul", "Milk - Raw Quart", "Milk","Dairy", "$5",""]
["Beltane Farms", "Paul", "Milk - Raw Half-gallon", "Milk","Dairy", "$10",""]
["Beltane Farms", "Paul", "Ripened Cheese - Vespers", "Cheese","Dairy", "$10",""]
["Beltane Farms", "Paul", "Ripened Cheese - Feta", "Cheese","Dairy", "$8",""]
["Beltane Farms", "Paul", "Ripened Cheese - Sundance", "Cheese","Dairy", "$10",""]
###
count = 0
Farmivore.ListingItem.FIXTURES =  src.map( (list) ->
  farm_id =  Farmivore.Farm.FIXTURES.findProperty('name', list[0]).id
  [price, priceUnit] = list[5].split(/\//)
  if m = price.match /^\$([\d\.]+)/
    price = m[1]
  ret =
    id: count++
    farm: farm_id
    # name: list[0]
    # farmerName: list[1]
    price: price
    priceUnit: priceUnit
    description: list[2]
    tag: list[3]
    category: list[4]
  )

###
n't add in Barberry Hill -- need to ask Kelly first
["Starlight Gardens", "David", "Arugula", "Greens","Vegetables", "$1/oz","Certified organic"]
["Starlight Gardens", "David", "Salad greens", "Greens","Vegetables", "$1/oz","Certified organic"]
["Starlight Gardens", "David", "Napoli greens", "Greens","Vegetables", "$5/bunch","Certified organic"]
["Starlight Gardens", "David", "Sweet peppers", "Peppers","Vegetables", "$5/lb","Certified organic"]
["Starlight Gardens", "David", "Kale - Winterbor 'Big Papi' ", "Greens","Vegetables", "$3/bunch","Certified organic"]
["Starlight Gardens", "David", "Daikon", "Root vegetables","Vegetables", "$2/lb","Certified organic"]
["Starlight Gardens", "David", "Hakeuri turnips", "Root vegetables","Vegetables", "$3.50/bunch","Certified organic"]
["Starlight Gardens", "David", "Mustard greens", "Greens","Vegetables", "$1/oz","Certified organic"]
["Starlight Gardens", "David", "Mizuna", "Greens","Vegetables", "$1/oz","Certified organic"]
["Starlight Gardens", "David", "Tyee spinach", "Greens","Vegetables", "$1/oz","Certified organic"]
["Starlight Gardens", "David", "Mesclun Greens", "Greens","Vegetables", "$6/bag","Certified organic"]
###
