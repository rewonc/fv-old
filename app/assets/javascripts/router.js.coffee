# For more information see: http://emberjs.com/guides/routing/
return unless $('#ember').length

Farmivore.Router.map ()->
  location: 'none'
  @resource "place"
  @resource "box"


Farmivore.ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    if $('#ember.mvp.choose').length
      @transitionTo('box')
    if $('#ember.places.show').length
      @transitionTo('place')

  activate: ->
  wag: 5
  model: ->
    @store.find('farm')

Farmivore.PlaceRoute = Ember.Route.extend
  activate: ->
  model: ->
    @store.find('farm').then (farms) =>
      place = @store.createRecord Fv.Place,
        title: "Wooster Square"
      farms.forEach (farm)->
        place.get('farms').pushObject farm
      @store.find(Fv.ListingItem).then (listingItems) ->
        listingItems.forEach (li) =>
          li.get('farm.listingItems').pushObject li
          li.get('farm').notifyPropertyChange('listingItems')
      place
  actions:
    showModal: (farm, listing)->
      utils.track('places:show-modal', $.extend(farm.mixPanelProps(), listingId: listing.get('id') ))
      modalId = "#modal-#{farm.get('name').substring(0,4)}"
      $(modalId).foundation('reveal', 'open')

Farmivore.BoxRoute = Ember.Route.extend
  activate: ->

  model: ->
    module1 =
      quantity: 0
      name: "Greens"
      unit: "4-6 salads worth"
      description1: "In season now: kale, mesclun, dandelion greens, arugula, mustard, Tyee spinach"
      description2: "Good for salads, green juices & smoothies"
      cost: 8
    module2 =
      quantity: 0
      name: "Fruit"
      unit: "4-6 salads worth"
      description1: "In season now: berries, oh my god so many berries"
      description2: "Good for people who like berries"
      cost: 17
    module3 =
      quantity: 0
      name: "Raw Veggies"
      unit: "6-8 servings"
      description1: "In season now: carrots, turnips, sweet peppers, radishes, celery"
      description2: "Good for when you want to be the insufferable asshole telling everyone about your raw diet"
      cost: 12
    boxOptions =
      name: "123"
      modules: [
        module1, module2, module3
      ].map( (o) -> Fv.BoxModule.create(o))
