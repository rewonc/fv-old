Fv.ShoppingListController = Ember.ArrayController.extend
  addListing: (listing) ->
    @get('content').pushObject listing

  init: ->
    @set 'content', []

  actions:
    removeListing: (listing) ->
      @get('content').removeAt @get('content').indexOf(listing)

