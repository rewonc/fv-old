#= require_self
#= require ./store
#= require_tree ./lib
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./templates
#= require ./router

if $('#ember').length > 0
  window.Farmivore = Ember.Application.create
    rootElement: "#ember"
  # Convenience alias.
  @Fv = Farmivore
else
  @Fv = @Farmivore = {}

# When an error occurs in a promise, dump it to console
# instead of silently failing.
# See: http://emberjs.com/guides/understanding-ember/debugging/
Ember.RSVP.configure 'onerror', (error) ->
  Ember.Logger.assert(false, error)
