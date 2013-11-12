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

  handleFilter: (param) ->

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
    @forEach (a, b, c) =>
      console.log "Removing #{a}"
      if a? && a.constructor == String
        @set(a.toString(), false)
    @_super()
  all: (->
    @get('length') ==  0
  ).property('[]')

  toggle: (param) ->
    if @contains(param)
      @remove param
    else
      @add param

  add: (param) ->
    Em.assert("Param must be a string", param.constructor == String)
    @_super(param)
    @set(param.toString(), true)

  remove: (param) ->
    Em.assert("Param must be a string", param.constructor == String)
    @_super(param)
    @set(param.toString(), false)








Fv.ListingItemController = Ember.ObjectController.extend()




