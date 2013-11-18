Fv.BoxModuleController = Ember.ObjectController.extend
  className: (->
    @get('name').toLowerCase().dasherize()
  ).property('name')
