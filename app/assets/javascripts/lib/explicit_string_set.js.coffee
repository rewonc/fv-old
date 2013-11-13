Fv.ExplicitStringSet = Ember.Set.extend Ember.Observable,
  clear: ->
    @forEach (stringKey) =>
      console.log "Removing #{stringKey}"
      if stringKey? && stringKey.constructor == String
        @set(stringKey.toString(), false)
    @_super()

  all: (->
    @get('length') ==  0
  ).property('[]')

  toggle: (stringKey) ->
    if @contains(stringKey)
      @remove stringKey
    else
      @add stringKey

  add: (stringKey) ->
    Em.assert("Param must be a string", stringKey.constructor == String)
    @_super(stringKey)
    @set(stringKey.toString(), true)

  remove: (stringKey) ->
    Em.assert("Param must be a string", stringKey.constructor == String)
    @_super(stringKey)
    @set(stringKey.toString(), false)

