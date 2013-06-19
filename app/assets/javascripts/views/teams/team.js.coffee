class FootballManager.Views.Team extends Backbone.View
  template: JST['teams/team']
  tagName: 'li'
  className: 'team'
  
  render: ->
    $(@el).html(@template(team: @model))
    this
