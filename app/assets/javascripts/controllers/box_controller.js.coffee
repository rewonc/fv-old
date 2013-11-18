Fv.BoxController = Ember.ObjectController.extend
  needs: "shoppingList"
  addModulex: (module)->
    # utils.track('places:add-listing-to-shopping-cart', listing.mixPanelProps())
    @get('controllers.shoppingList').addListing listing

Fv.BoxOptionsController = Ember.ArrayController.extend
  needs: 'box'
  totalCost: (->
    @content.mapProperty('totalCost').reduce((sum, cost) -> sum + cost)
  ).property 'content.@each.quantity', 'content.[]'

  totalNumItems: (->
    @content.mapProperty('quantity').reduce((sum, qty) -> sum + qty)
  ).property 'content.@each.quantity', 'content.[]'

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
    addModule: (module) ->
      module.incrementProperty('quantity')

    incrementQuantity: (listItem) ->
      listItem.incrementProperty('quantity')
      # utils.track('shopping-list:increment-quantity', listItem.get('content').mixPanelProps())
      # @incrementQuantity(listItem)

    decrementQuantity: (listItem) ->
      listItem.decrementProperty('quantity')
      # utils.track('shopping-list:decrement-quantity', listItem.get('content').mixPanelProps())
      # @decrementQuantity(listItem)

    removeAll: (listItem) ->
      utils.track('shopping-list:remove-all', listItem.get('content').mixPanelProps())
      @removeAll listItem
