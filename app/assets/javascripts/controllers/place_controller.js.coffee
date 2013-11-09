Fv.PlaceController = Ember.ObjectController.extend
  needs: "shoppingList"
  _xadslfajf: 5
  allListings: (->
    listings = []
    @get('farms').forEach (farm) ->
      farm.get('listingItems').forEach (li)->
        listings.pushObject li
    listings
  ).property 'content.farms.@each.listingItems', 'content', 'content.farms', 'content.farms.@each'

  actions:
    addToShoppingList: (listing)->
      @get('controllers.shoppingList').addListing listing


Fv.ShoppingListController = Ember.ArrayController.extend
  addListing: (listing) ->
    @get('content').pushObject listing
  init: ->
    @set 'content', []

Fv.PlaceListingsController = Ember.ArrayController.extend
  sortProperties: ['sortKey']
  sortAscending: true
  actions:
    sortBy: (param) ->
      @set 'sortProperties', [param]


