Fv.BoxController = Ember.ObjectController.extend
  needs: "shoppingList"
  addModulex: (module)->
    # utils.track('places:add-listing-to-shopping-cart', listing.mixPanelProps())
    @get('controllers.shoppingList').addListing listing

Fv.PlanOptionsController = Ember.ArrayController.extend
  init: ->
    p1 =
      name: "3 month subscription"
      active: false
    p2 =
      name: "1 month subscription"
      active: false
    p3 =
      name: "weekly subscription"
      active: false
    @set 'plans', [p1, p2, p3].map( (p)->Ember.Object.create(p) )
  actions:
    selectPlan: (plan) ->
      @get('plans').setEach('active', false)
      plan.set('active', true)


Fv.PlanOptionsView = Ember.View.extend()
Fv.PlanOptionView = Ember.View.extend
  click: ->
    @get('controller').send 'selectPlan', @get('controller.content')

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
      listItem.decrementProperty('quantity') if listItem.get('quantity') > 0
      # utils.track('shopping-list:decrement-quantity', listItem.get('content').mixPanelProps())
      # @decrementQuantity(listItem)

    removeAll: (listItem) ->
      utils.track('shopping-list:remove-all', listItem.get('content').mixPanelProps())
      @removeAll listItem
