$ ->
  class App.CardSearch extends Backbone.View
    
    el: '.card_search'
      
    events:
      'keyup input': 'key_up'
      'click input': 'key_up'
      'click a': 'add_to_collection'
    
    template: JST['templates/card_search']
    results_template: JST['templates/search_results']
    
    placeholder: 'search for a card'
    
    initialize: ->
      @search_text = ''
      @results = new App.SearchResults
      @results.bind 'reset', @render_results, this
    
    render: ->
      $(@el).html @template(this)
      @input = @$('input')
      this
    
    render_results: ->
      @$('.results').html @results_template(this)
      
    search: ->
      @search_text = @$('input').val()
      if @search_text.length
        @results.search_for @search_text
      else
        @results.reset()
    
    add_to_collection: (e) ->
      id = $(e.target).attr('data-card-id')
      card = @results.get id
      copy = app.copy_for_card card
      if copy
        copy.bump_count()
      else
        copy = new App.Copy count: 1, card_id: id, card: card.toJSON()
        app.copies.add copy
        copy.save()
    
    key_up: _.debounce (-> @search(); true), 1000