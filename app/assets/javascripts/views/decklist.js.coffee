$ ->
  class App.Decklist extends Backbone.View
  
    template: JST["templates/decklist"]
  
    el: '#decklist'
  
    initialize: ->
      @model.decks.bind 'all', @render, this
  
    render: ->
      $(@el).html @template(@model)
      this
