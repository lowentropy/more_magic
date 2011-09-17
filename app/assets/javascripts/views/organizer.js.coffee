class App.Organizer extends Backbone.View

  template: JST['templates/organizer']

  initialize: (app) ->
    @app = app
    @app.copies.bind 'all', @render, this

  render: ->
    @el = $ '#organizer'
    @el.html @template(@app)
