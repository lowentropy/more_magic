class App.Collection extends Backbone.View
  
  el: '#collection'
  
  initialize: ->
    @copies = new App.Copies
    @decks = new App.Decks
    @sidebar = new App.Sidebar this
    @header = new App.Header this
    @stats = new App.Stats this
    @decklist = new App.Decklist this
    @organizer = new App.Organizer this
    @copies.fetch()

  render: ->
    