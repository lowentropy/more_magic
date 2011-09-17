class App.Stats extends Backbone.View
  
  template: JST['templates/stats']
  
  initialize: (app) ->
    @app = app
  
  render: ->
    @el = $ '#stats'
    @el.html @template(@app)