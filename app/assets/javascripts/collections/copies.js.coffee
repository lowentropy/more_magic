#= require ../models/copy
class App.Copies extends Backbone.Collection
  model: App.Copy
  url: '/copies'
    
  comparator: (copy) -> copy.card_name()
  total_cards: -> _.sum @pluck('count')