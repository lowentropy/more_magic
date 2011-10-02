#= require ../models/card

$ ->
  class App.SearchResults extends Backbone.Collection
    model: App.Card
    url: '/cards/search'
    
    search_for: (text) ->
      @fetch data: {q: text}