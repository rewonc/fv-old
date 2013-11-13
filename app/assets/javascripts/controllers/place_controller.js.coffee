Fv.PlaceController = Ember.ObjectController.extend
  needs: "shoppingList"
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

Fv.PlaceListingsController = Ember.ArrayController.extend
  sortProperties: ['sortKey']
  sortAscending: true
  sortingBy: null
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
    @set 'sortingBy', Fv.ExplicitStringSet.create()

Fv.ListingItemController = Ember.ObjectController.extend()
