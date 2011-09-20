$ ->
  class App.Copy extends Backbone.Model
    
    paramRoot: 'copy'
    hiddenParams: ['card']
  
    defaults:
      count: 0
      card: null
    
    card_name: ->
      @get('card')?.name
