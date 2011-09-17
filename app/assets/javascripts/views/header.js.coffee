class App.Header extends Backbone.View
  
  template: JST['templates/header']
  
  initialize: (app) ->
    @app = app
    @app.copies.bind 'all', @render, this
    
  render: ->
    @el = $ '#header'
    @el.html @template(@app)
