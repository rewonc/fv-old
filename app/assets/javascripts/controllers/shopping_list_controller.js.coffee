Fv.ShoppingListController = Ember.ArrayController.extend
  totalCost: (->
    @content.mapProperty('totalCost').reduce((sum, cost) -> sum + cost)
  ).property 'content.@each.quantity', 'content.[]'

  totalNumItems: (->
    @content.mapProperty('quantity').reduce((sum, qty) -> sum + qty)
  ).property 'content.@each.quantity', 'content.[]'

  # @param listItem [Fv.ListingItem] -- the ListingItem to add
  # Wraps `listItem` in a `ShoppingListItem` and adds to content.
  addListing: (listItem) ->
    shoppingListItem = @get('content').findProperty("id", listItem.get('id'))
    unless shoppingListItem?
      shoppingListItem = Fv.ShoppingListItem.create(content: listItem)
      @get('content').pushObject shoppingListItem
    shoppingListItem.incrementProperty('quantity')

  init: ->
    @set 'content', []

  actions:
    removeListing: (listItem) ->
      shoppingListItem = @get('content').findProperty("id", listItem.get('id'))
      qty = shoppingListItem.get('quantity')
      Em.assert("Quantity is > 0", qty > 0)
      if qty > 1
        shoppingListItem.decrementProperty 'quantity'
      else
        @content.removeObject shoppingListItem
      # @get('content').removeAt @get('content').indexOf(listing)

Fv.ShoppingListItem = Ember.ObjectProxy.extend
  content: null
  quantity: 0
  totalCost: (->
    @get('price') * @quantity
  ).property('quantity')
