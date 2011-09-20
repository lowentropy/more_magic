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
      @copies.fetch()

    render: ->
    