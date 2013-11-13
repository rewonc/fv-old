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

  actions:
    removeListing: (listing) ->
      @get('content').removeAt @get('content').indexOf(listing)


Fv.PlaceListingsController = Ember.ArrayController.extend
  sortProperties: ['sortKey']
  sortAscending: true
  filterCategories: null
  filtered: (->

    @get('arrangedContent').filter (item, idx) =>
      if @get('filterCategories.length')
        @get('filterCategories').any (category) ->
          item.get('category').toLowerCase() == category.toLowerCase()

      # If filterCategories is empty, then show everything
      else
        true
  ).property('arrangedContent.@each', 'filterCategories.[]')

  actions:
    sortBy: (param) ->
      @set 'sortProperties', [param]
    filterBy: (param) ->
      categories = @get('filterCategories')
      categories.toggle(param)
    clearFilters: ->
      @get('filterCategories').clear()

  init: ->
    @set 'filterCategories', Fv.ExplicitStringSet.create()

Fv.ExplicitStringSet = Ember.Set.extend Ember.Observable,

  clear: ->
    @forEach (stringKey) =>
      console.log "Removing #{stringKey}"
      if stringKey? && stringKey.constructor == String
        @set(stringKey.toString(), false)
    @_super()

  all: (->
    @get('length') ==  0
  ).property('[]')

  toggle: (stringKey) ->
    if @contains(stringKey)
      @remove stringKey
    else
      @add stringKey

  add: (stringKey) ->
    Em.assert("Param must be a string", stringKey.constructor == String)
    @_super(stringKey)
    @set(stringKey.toString(), true)

  remove: (stringKey) ->
    Em.assert("Param must be a string", stringKey.constructor == String)
    @_super(stringKey)
    @set(stringKey.toString(), false)

Fv.ListingItemController = Ember.ObjectController.extend()
