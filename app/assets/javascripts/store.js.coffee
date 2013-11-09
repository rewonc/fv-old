# http://emberjs.com/guides/models/using-the-store/

Farmivore.Store = DS.Store.extend()
  # Override the default adapter with the `DS.ActiveModelAdapter` which
  # is built to work nicely with the ActiveModel::Serializers gem.
  # adapter: '_ams'
Farmivore.ApplicationAdapter = DS.FixtureAdapter.extend()

###
Implement this method in order to query fixtures data

@method queryFixtures
@param  fixture
@param  query
@param  type
###
###
queryFixtures: (fixtures, query, type)->
  fixtures = fixtures.filter (item) ->
    valid = true
    for k, v of query
      valid = valid && (item[k] == v)
    valid
  fixtures
###
