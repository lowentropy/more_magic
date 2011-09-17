class App.Sidebar extends Backbone.View
  
  template: JST['templates/sidebar']
  
  initialize: (app) ->
    @app = app
  
  render: ->
    @el = $ '#sidebar'
    @el.html @template(@app)