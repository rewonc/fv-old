Farmivore.BoxModule = Ember.Object.extend
  name: ""
  quantity: 0
  description1: ""
  description2: ""
  cost: 17
  totalCost: (->
    @get('quantity') * @get('cost')
  ).property('quantity', 'cost')


