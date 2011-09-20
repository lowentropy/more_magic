$ ->
  class App.CopyView extends Backbone.View
  
    template: Brace 'templates/copy'
  
    tagName: 'li'
  
    events:
      'change .count': 'change_count'

    render: ->
      $(@el).html @template(@model)
      this
  
    get_count: ->
      count = parseInt @$('.count').val()
      if count != count then 0 else count
  
    change_count: ->
      @model.save count: @get_count()
