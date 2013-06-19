class FootballManager.Routers.Teams extends Backbone.Router

  routes:
    '': 'index'
    'teams/:id': 'show'

  initialize: ->
    @collection = new FootballManager.Collections.Teams()
    @collection.fetch(reset: true)
                
  index: ->
    view = new FootballManager.Views.TeamsIndex(collection: @collection)
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Team #{id}"
