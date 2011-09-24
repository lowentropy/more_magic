$ ->
  class App.CardSearch extends Backbone.View
    
    el: '.card_search'
      
    events:
      'keyup input': 'key_up'
    
    template: JST['templates/card_search']
    
    placeholder: 'search for a card'
    
    initialize: ->
      @search_text = ''
    
    render: ->
      $(@el).html @template(this)
      @input = @$('input')
      this
      
    search: ->
      @search_text = @$('input').val()
      alert "search: #{@search_text}"
    
    key_up: _.debounce (-> @search()), 1000