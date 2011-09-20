$ ->
  class App.Stats extends Backbone.View
  
    template: JST['templates/stats']
  
    el: '#stats'
  
    render: ->
      $(@el).html @template(@model)
      this