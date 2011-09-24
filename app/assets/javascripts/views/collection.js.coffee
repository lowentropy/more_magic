#= require_tree ../models
#= require_tree ../collections

$ ->
  class App.CardCollection extends Backbone.View
  
    initialize: ->
      @copies = new App.Copies
      @decks = new App.Decks
      @sidebar = new App.Sidebar model: this
      @header = new App.Header model: this
      @stats = new App.Stats model: this
      @decklist = new App.Decklist model: this
      @organizer = new App.Organizer model: this
      @card_sets = new App.CardSets
      @card_search = new App.CardSearch
      @bind_events()
      @card_sets.fetch()
    
    bind_events: ->
      @card_sets.bind 'reset', @fetch_copies, this
      @copies.bind 'reset', @render, this
    
    fetch_copies: ->
      @copies.fetch()
    
    render: ->
      @card_search.render()