class App.Header extends Backbone.View
  
  el: '#header'
  
  template: JST['templates/header']
  
  initialize: (app) ->
    @app = app
    @app.copies.bind 'all', @render, this
    
  render: ->
    $(@el).html @template(@app)
