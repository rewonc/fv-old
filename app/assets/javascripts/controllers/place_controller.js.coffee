Fv.PlaceController = Ember.ObjectController.extend
  _xadslfajf: 5
  allListings: (->
    listings = []
    @get('farms').forEach (farm) ->
      farm.get('listingItems').forEach (li)->
        listings.pushObject li
    listings
  ).property()


