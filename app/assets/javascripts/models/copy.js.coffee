$ ->
  class App.Copy extends Backbone.Model
    
    paramRoot: 'copy'
    hiddenParams: ['card']
  
    defaults:
      count: 0
      card: null
    
    card_name: ->
      @get('card')?.name

    card_set: ->
      @_card_set ?= app.card_sets.get @get('card').card_set_id
      
    image_url: ->
      set = @card_set().get 'code'
      num = @get('card').num
      "http://magiccards.info/scans/en/#{set}/#{num}.jpg"
      