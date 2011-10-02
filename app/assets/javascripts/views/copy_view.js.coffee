$ ->
  class App.CopyView extends Backbone.View
  
    template: JST['templates/copy']
  
    tagName: 'li'
    className: 'horizontal'
  
    events:
      'change .count': 'change_count'
    
    initialize: ->
      @model.bind 'change:count', @render_count, this

    render: ->
      $(@el).html @template(this)
      this
    
    render_count: ->
      @$('.count').val @model.get('count')
  
    get_count: ->
      count = parseInt @$('.count').val()
      if count != count then 0 else count
  
    change_count: ->
      @model.save count: @get_count()
    
    card_set: ->
      @model.card_set()
    
    card_set_image: ->
      alt = "#{@card_set().get('name')} (#{@model.get('rarity')})"
      url = @card_set().image_url rarity: @model.get('rarity')
      "<img src='#{url}' alt='#{alt}' title='#{alt}' />"

    card_image: (opts={}) ->
      size = opts.size ? 'large'
      css = "#{opts.css} card #{size}"
      alt = @model.get 'name'
      url = @model.image_url()
      "<img src='#{url}' alt='#{alt}' title='#{alt}' class='#{css}' />"
