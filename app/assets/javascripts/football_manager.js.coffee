window.FootballManager =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
    new FootballManager.Routers.Teams
    Backbone.history.start()

$(document).ready ->
  FootballManager.initialize()
