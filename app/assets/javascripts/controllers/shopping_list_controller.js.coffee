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

  incrementQuantity: (listItem) ->
    listItem.incrementProperty('quantity')

  decrementQuantity: (listItem) ->
    shoppingListItem = @get('content').findProperty("id", listItem.get('id'))
    qty = shoppingListItem.get('quantity')
    if qty > 1
      shoppingListItem.decrementProperty 'quantity'
    else
      @content.removeObject shoppingListItem

  removeAll: (listItem) ->
    @content.removeObject listItem

  init: ->
    @set 'content', []

  actions:
    incrementQuantity: (listItem) ->
      @incrementQuantity(listItem)

    decrementQuantity: (listItem) ->
      @decrementQuantity(listItem)

    removeAll: (listItem) ->
      @removeAll listItem



Fv.ShoppingListItem = Ember.ObjectProxy.extend
  content: null
  quantity: 0
  totalCost: (->
    @get('price') * @quantity
  ).property('quantity')
