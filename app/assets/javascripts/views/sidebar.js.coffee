$ ->
  class App.Sidebar extends Backbone.View
  
    template: JST['templates/sidebar']
  
    el: '#sidebar'
  
    render: ->
      $(@el).html @template(@model)
      this