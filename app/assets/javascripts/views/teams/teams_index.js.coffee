class FootballManager.Views.TeamsIndex extends Backbone.View

  template: JST['teams/index']

  render: ->
    $(@el).html(@template(teams: "Teams"))
    this
