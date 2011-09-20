#= require ../models/deck

$ ->
  class App.Decks extends Backbone.Collection
    model: App.Deck
    url: '/decks'

    comparator: (deck) -> deck.get('name')
