class FootballManager.Views.Team extends Backbone.View
  template: JST['teams/team']
  tagName: 'li'
  className: 'team'

  initialize: ->
    @model.on('change', @render, this)
  
  render: ->
    $(@el).html(@template(team: @model))
    this
