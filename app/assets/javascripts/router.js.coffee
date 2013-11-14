# For more information see: http://emberjs.com/guides/routing/

Farmivore.Router.map ()->
  location: 'none'
  @resource "place"


Farmivore.ApplicationRoute = Ember.Route.extend
  beforeModel: ->
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
