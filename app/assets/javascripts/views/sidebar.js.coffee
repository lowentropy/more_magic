class App.Sidebar extends Backbone.View
  
  el: '#sidebar'
  
  template: JST['templates/sidebar']
  
  initialize: (app) ->
    @app = app
  
  render: ->
    @el.html @template(@app)