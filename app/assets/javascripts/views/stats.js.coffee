class App.Stats extends Backbone.View
  
  el: '#stats'
  
  template: JST['templates/stats']
  
  initialize: (app) ->
    @app = app
  
  render: ->
    @el.html @template(@app)