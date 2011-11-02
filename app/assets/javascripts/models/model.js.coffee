$ ->
  class App.Price extends Backbone.Model
    low: -> @get 'low'
    mid: -> @get 'mid'
    high: -> @get 'high'