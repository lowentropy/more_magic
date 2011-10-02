$ ->
  class App.Organizer extends Backbone.View

    el: '#organizer'
    
    initialize: ->
      @model.copies.bind 'add', @add_one, this
      @model.copies.bind 'reset', @add_all, this
      @list = @$ 'ul'

    render: ->
      @el.html ''
      this

    add_one: (copy) ->
      view = new App.CopyView(model: copy)
      @list.append view.render().el

    add_all: ->
      @model.copies.each (copy) => @add_one copy
