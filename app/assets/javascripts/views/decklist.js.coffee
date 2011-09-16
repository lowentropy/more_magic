class App.Decklist extends Backbone.View
  
  el: 'decklist'
  
  template: JST["templates/decklist"]
  
  initialize: (app) ->
    @app = app
    @app.decks.bind 'all', @render, this
  
  render: ->
    @el.html @template(@app)
