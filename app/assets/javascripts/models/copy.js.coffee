class App.Copy extends Backbone.Model
  
  defaults: ->
    count: 0
    card: null
  
  card_name: ->
    @get('card')?.name
