#= require_self
#= require ./store
#= require ./utils/utils
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
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
