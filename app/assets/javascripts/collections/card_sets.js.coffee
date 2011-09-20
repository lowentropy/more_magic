#= require ../models/card_set

$ ->
  class App.CardSets extends Backbone.Collection
    model: App.CardSet
    url: '/card_sets'
