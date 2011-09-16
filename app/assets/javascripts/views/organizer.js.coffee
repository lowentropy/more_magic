class App.Organizer extends Backbone.View
  
  el: '#organizer'
  
  template: JST['templates/organizer']
  
  initialize: (app) ->
    @app = app
    @app.copies.bind 'all', @render, this
  
  render: ->
    @el.html @template(@app)