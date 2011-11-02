#= require ../models/price

$ ->
  class App.PriceView extends Backbone.View
    tagName: 'span'
    className: 'price'
      
    template: JST['templates/price']

    initialize: (@url) ->
      @model = new App.Price
      @model.bind 'all', @render, this
      @model.fetch url: @url
      
    render: ->
      $(@el).html @template(@model.toJSON())
      this