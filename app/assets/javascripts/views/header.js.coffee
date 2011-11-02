#= require ./price_view

$ ->
  class App.Header extends Backbone.View
  
    template: JST['templates/header']
  
    el: '#header'
  
    initialize: ->
      @model.copies.bind 'all', @render, this
      @price = new App.PriceView '/collection/price'
    
    render: ->
      $(@el).html @template(@model)
      $(@el).append @price.el
      this
