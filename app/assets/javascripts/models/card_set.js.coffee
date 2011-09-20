$ ->
  class App.CardSet extends Backbone.Model
    
    image_url: (opts={}) ->
      size = opts.size ? 'small'
      rarity = (opts.rarity ? 'Common').substring(0, 1).toUpperCase()
      rarity = 'C' if rarity == 'S'
      set = @get 'gatherer_code'
      "http://gatherer.wizards.com/Handlers/Image.ashx?type=symbol&set=#{set}&size=#{size}&rarity=#{rarity}"
      