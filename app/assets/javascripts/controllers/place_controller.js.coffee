Fv.PlaceController = Ember.ObjectController.extend
  _xadslfajf: 5
  allListings: (->
    listings = []
    @get('farms').forEach (farm) ->
      farm.get('listingItems').forEach (li)->
        listings.pushObject li
    listings
  ).property 'content.farms.@each.listingItems', 'content', 'content.farms', 'content.farms.@each'

Fv.PlaceListingsController = Ember.ArrayController.extend
  sortProperties: ['sortKey']
  sortAscending: true


