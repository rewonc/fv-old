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
      utils.track('places:add-listing-to-shopping-cart', listing.mixPanelProps())
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
      else
        true

  ).property('arrangedContent.@each', 'filterCategories.[]')

  actions:
    sortBy: (param) ->
      utils.track('places:sort-by', field: param)
      @set 'sortProperties', [param]

    filterBy: (param) ->
      utils.track('places:filter-by', category: param)
      categories = @get('filterCategories')
      unless categories.get(param)
        @send 'clearFilters'
      categories.toggle(param)

    clearFilters: ->
      utils.track('places:clear-filters')
      @get('filterCategories').clear()

  init: ->
    @set 'filterCategories', Fv.ExplicitStringSet.create()
    @set 'sortingBy', Fv.ExplicitStringSet.create()

Fv.ListingItemController = Ember.ObjectController.extend()
