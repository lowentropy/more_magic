class App.Decklist extends Backbone.View
  
  template: JST["templates/decklist"]
  
  initialize: (app) ->
    @app = app
    @app.decks.bind 'all', @render, this
  
  render: ->
    @el = $ '#decklist'
    @el.html @template(@app)
