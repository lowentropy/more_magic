$ ->
  class App.Header extends Backbone.View
  
    template: JST['templates/header']
  
    el: '#header'
  
    initialize: ->
      @model.copies.bind 'all', @render, this
    
    render: ->
      $(@el).html @template(@model)
      this
