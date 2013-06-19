class FootballManager.Routers.Teams extends Backbone.Router

  routes:
    '': 'index'
    'teams/:id': 'show'
                
  index: ->
    view = new FootballManager.Views.TeamsIndex()
    $('#container').html(view.render().el)

  show: (id) ->
    alert "Team #{id}"
